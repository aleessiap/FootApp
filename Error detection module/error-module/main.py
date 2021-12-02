import pandas as pd  # version 0.24.2
from functools import reduce
import glob

from mlxtend.preprocessing import TransactionEncoder  # 0.17
from mlxtend.frequent_patterns import apriori
from mlxtend.frequent_patterns import association_rules



def preprocessingDataSet():
    all_files = glob.glob("../matches/training/*.xls")
    for filename in all_files:
        df = pd.read_excel(filename, sep=';', header=0)
        name = df["Partita"][1]
        df = df.drop(
            ["Epis.", "Partita", "Squadra", "Inizio", "Fine", 'Note', "Tempo", 'A Giocatore', "Tags", "Giocatori",
             "A Giocatore"], axis=1)
        df.to_csv("preprocessed/" + name + ".csv", sep=",", header=False, index=None)


# function to prepare the dataset to be passed at the algorithm
def prep_dataset(window):
    all_files = glob.glob("./preprocessed/*.csv")
    l = list()
    for filename in all_files:
        file = open(filename)
        lines = file.readlines()

        for i in range(len(lines)):
            li = list()
            if i != 0:
                line = ""
                for x in range(window):
                    if (x + i) < len(lines):
                        line = line + lines[i + x].replace("\n", ",")
                if (i + (window - 1)) < len(lines):
                    line = line + lines[i + (window - 1)].replace("\n", "")
                line = line.replace('"', '')
                line = line.replace(" ,", ",")
                line = line.replace(", ", ",")
                line = line.replace(";", ",")
                for e in (line.split(",")):
                    if e != "":
                        li.append(e)
                l.append(li)

    return l


if __name__ == '__main__':
    min_support = 0.007
    max_length = 5
    min_confidence = 0.10
    sliding_window_length = 5

    preprocessingDataSet()
    transactions = prep_dataset(sliding_window_length)

    # pd.Series(transactions).to_csv("transaction.csv", header=False)
    te = TransactionEncoder()
    te_ary = te.fit_transform(transactions)

    df = pd.DataFrame(te_ary, columns=te.columns_)
    frequent_itemsets = apriori(df, min_support=min_support, use_colnames=True, max_len=max_length)

    rules = association_rules(frequent_itemsets, metric="confidence", min_threshold=min_confidence)

    rules = rules.sort_values(by=['confidence', 'support'], ascending=False)

    rulesA = rules["antecedents"].apply(lambda x: ', '.join(list(x))).astype("unicode")
    rulesC = rules["consequents"].apply(lambda x: ', '.join(list(x))).astype("unicode")

    rulesConf = rules["confidence"].astype("unicode")
    rulesSupport = rules["support"].astype("unicode")
    # rulesLift = rules["lift"].astype("unicode")
    # rulesLeverage = rules["leverage"].astype("unicode")
    rulesConvinction = rules["conviction"].astype("unicode")

    df = pd.DataFrame(
        pd.concat([rulesA, rulesC, rulesConf, rulesSupport, rulesConvinction], axis=1))
    df.to_csv("Rules.csv", sep="\t", index=None)
