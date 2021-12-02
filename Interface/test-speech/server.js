const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');

const app = express();
const port = process.env.PORT || 5000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
var pgp = require('pg-promise')(/*options*/);

/**
 * Setup di connessione al database
 * @type {{database: string, password: string, port: number, host: string, user: string}}
 */
var cn = {
  host:'localhost',
  port: 5432,
  database: 'thefooturelab',
  user: 'postgres',
  password: 'daltonico'
};
var db = pgp(cn);
const format = require('pg-format');


// API calls
app.get('/api/get_controTag', (req, res) => {
    db.result('select * from controTag ;').then(user =>{
        res.json(user.rows);}).catch(error =>{console.log(error)})
});

app.get('/api/get_tags', (req, res) => {
    var rows;
    db.result(`Select id,name  from tags order by name`).then(user =>{
        rows = user.rows;
        res.json(rows);}).catch(error =>{console.log(error)})
});


app.get('/api/get_tagCombinations', (req, res) => {
    var rows;
    db.result(`Select id,name from public."TagCombinations"`).then(user =>{
        rows = user.rows;
        res.json(rows);}).catch(error =>{console.log(error)})
});

app.get('/api/get_tagCombinationsHierarchies', (req, res) => {
    var rows;
    db.result(`Select * from TagCombinationSet`).then(user =>{
        rows = user.rows;
        res.json(rows);}).catch(error =>{console.log(error)})
});
app.post('/api/upload_events',(req,res) =>{
    let data = req.body['data'];
    console.log(data);
    let loop = true;
    data.uploaded = false;
    let virg= ",";
    let apici ="'";
    console.log(apici);
    let query1 = 'INSERT INTO public.events (start_event, end_event,note,match_id,period_id,player_id,team_id,created_by_id) VALUES ('+ data.time + virg + data.time +5 + virg
        + apici + data.note + apici + virg + data.match_id + virg + 1 + virg + data.player_id + virg + data.team_id + virg + 2 + ') returning id';
    console.log(query1);
    db.query(query1).then(rows => {
        if(rows.length > 0){
            db.result(`Select id from public."tagCombinationToVersions" where "tagCombination_id" = '${data.combination_id}' limit 1`).then(
                rows1 =>{
                    if(rows1.rows[0].id){
                        let query2 = 'INSERT INTO public."events_tagCombinations" (event_id, tagcombinationtoversion_id,sort_value) VALUES (' + rows[0].id + ','+rows1.rows[0].id + ',' + 1 +')';

                        db.result(query2).then(
                            result =>{
                                data.uploaded = true;
                                res.json(data);
                            }
                        ).catch(error=>{console.log(error)});
                    }
                }
            ).catch(error=>{console.log(error)});
        }});
});

app.post('/api/upload_eventsTagCombination',(req,res) =>{
    let combination_id = req.body['combination_id'];
    let event_id = req.body['event_id'];
    db.result(`Select id from public."tagCombinationToVersions" where "tagCombination_id" = '${combination_id}' limit 1`).then(
        rows =>{
            if(rows.rows[0].id){
                let query1 = 'INSERT INTO public."events_tagCombinations" (event_id, tagcombinationtoversion_id,sort_value) VALUES (' + event_id + ','+rows.rows[0].id + ',' + 1 +')';
                db.result(query1).then(
                    result =>{
                    }
                ).catch(error=>{console.log(error)});
            }
        }
    ).catch(error=>{console.log(error)});
});

app.post('/api/get_auth', (req, res) => {
    let username= req.body['username'];
    let password = req.body['password'];
    var pbkdf2 = require('pbkdf2-sha256');

    db.result(`Select * from auth_user where username = '${username}' limit 1`).then(
        user =>{
            for(let index =0; index<user.rows.length;index++){
                let dbPassword = user.rows[index]['password'];
                let parts = dbPassword.split('$');
                let salt = parts[2];
                let iterations = parts[1];
                let algorithm = parts[0];
                let hashed = pbkdf2(password, new Buffer(salt), iterations, 32).toString('base64');
                let finalPass = algorithm +'$'+ iterations +'$'+ salt +'$'+  hashed;
                if(finalPass===dbPassword){
                    res.json(user.rows[index]);
                }else{
                    res.json(null);
                }
            }
        }
    ).catch(error=>{console.log(error)});
});

app.post('/api/get_tagcombinationFromMatch', (req, res) => {
    let match_id= req.body['match_id'];
    db.result(`Select * from get_TagCombinationFromMatch where match_id = '${match_id}'`).then(
        combination =>{
            res.json(combination.rows);
        }
    ).catch(error=>{console.log(error)});
});

app.post('/api/get_players', (req, res) => {
    let home= req.body['home'];
    let away = req.body['away'];
    let players = {home:0,away:0};
    db.result(`select * from get_Players where team_id  = '${home}'`).then(
        home =>{
            players['home'] = home;
            db.result(`select * from get_Players where team_id  = '${away}'`).then(
                away =>{
                    players['away'] = away;
                    res.json({home:home.rows,away:away.rows});
                }
            ).catch(error=>{console.log(error)});
        }
    ).catch(error=>{console.log(error)});
});

app.get('/api/get_competitions', (req, res) => {
    db.result(`Select * from competitions`).then(competions =>{
        res.json(competions.rows);
    }).catch(error =>{console.log(error)})

});
app.get('/api/get_matches', (req, res) => {
    db.result(`select * from get_Matches`).then(matches =>{
        let query1 = 'select * from operators_matches';
        db.result(query1).then(
            result =>{
                let op = {op: result.rows,matches: matches.rows};
                res.json(op);
            }
        ).catch(error=>{console.log(error)});
    }).catch(error =>{console.log(error)})

});


if (process.env.NODE_ENV === 'production') {
  // Serve any static files
  app.use(express.static(path.join(__dirname, 'client/build')));

  // Handle React routing, return all requests to React app
  app.get('*', function(req, res) {
    res.sendFile(path.join(__dirname, 'client/build', 'ActionTypes.js.html'));
  });
}

app.listen(port, () => console.log(`Listening on port ${port}`));
