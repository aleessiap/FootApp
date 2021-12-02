import pandas as pd  # version 0.24.2
from functools import reduce


# function to create a sliding window of n elements
def make_sliding(df, n):
    dfs = [df.shift(-i).applymap(lambda x: [x]) for i in range(0, n+1)]

    return reduce(lambda x, y: x.add(y), dfs)


# function to make preprocessing of the testset
def create_testset(filename, episodePerTransaction):
    episodePerTransaction = episodePerTransaction+1
    dataset = pd.read_excel(filename, sep=";", header=0, index_col=None)
    dataset = dataset.drop(
        ["Epis.", "Partita", "Squadra", "Inizio", "Fine", 'Note', "Tempo", 'A Giocatore', "Tags", "Giocatori",
         "A Giocatore"], axis=1)

    # The cropped dataset is saved in order to perform correctness  during experimentation.
    dataset.to_csv("preprocessed_testset.csv", sep=",", header=False, index=None)
    df = pd.read_csv("preprocessed_testset.csv", sep=",", header=0, index_col=None)
    d = make_sliding(df, episodePerTransaction)
    clear_list = list()
    dlist = d.values.tolist()
    for l in dlist:
        list_transaction = list();
        for x in l:
            x = list(set(x))
            for n in x:
                if type(n) == str:
                    n = n.replace(", ", ",")
                    n = n.split(",")
                    for y in n:
                        list_transaction.append([y])
        clear_list.append(list_transaction)
    return clear_list


# function used to check if an annotation respect the rules or not
# it returns in output the list of indexes of rules that are not respected in the new annotated match
def check_rules(items, rulesAntecedent, rulesConsequent):
    rules_not_respected = list()

    items = [item for sublist in items for item in sublist]
    for i in range(len(rulesAntecedent)):

        respectAntecedent = all(s in items for s in rulesAntecedent[i])
        respectConsequent = all(s in items for s in rulesConsequent[i])

        if respectAntecedent and not respectConsequent:

            rules_not_respected.append(i)

    return rules_not_respected


if __name__ == '__main__':
    rulesExtracted = pd.read_csv("./Rules.csv", sep="\t")
    rulesA = list(rulesExtracted["antecedents"])
    rA = list()
    print(rulesA)
    for l in rulesA:
        l = l.replace('"', '')
        s = l.split(', ')
        rA.append(s)
    print(rA)
    rulesC = list(rulesExtracted["consequents"])
    rC = list()
    print(rulesC)
    for l in rulesC:
        l = l.replace('"', '')
        s = l.split(', ')
        rC.append(s)

    print(rC)

    test = create_testset("../matches/testing/BOLOGNA PRIMAVERA-ROMA PRIMAVERA.xls", 5)
    for i in range(len(test)):
        r = check_rules(test[i], rA, rC)
        if len(r) > 0:
            print("-----")
            print("Item " + str(test[i]) + " does not respect these rules: \n")

            for j in r:
                print(rulesA[j] + "  ->  " + rulesC[j] + "\n")
            print("-----")