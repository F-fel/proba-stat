import numpy as np
import subprocess
from scipy import stats
from matplotlib import pyplot as plt
import pandas as pd
import platform
# Methodes pour lire les donnees
# class qui contient les donne d'un echantillon


class Data:
    def __init__(self, num, vente, prix, publicite, region):
        self.num = num
        self.sales = round(vente, 2)
        self.price = round(prix, 2)
        self.advertising = round(publicite, 2)
        self.region = region

    def __str__(self) -> str:
        return f'{self.sales}, {self.price}, {self.advertising} , {self.region}'
# methode pour convertir une ligne de csv (utilisant ; comme separateur)


def line_to_data(line):
    info = line.split(";")
    num = int(info[0][1:-1])
    vente = float(info[1].replace(",", ".")) * 1000
    price = float(info[2].replace(",", "."))
    ads = float(info[3].replace(",", ".")) * 1000
    region = int(info[4])
    return Data(num, vente, price, ads, region)
# method qui retourne une liste des donnee a partir du fichier


def load_data(filename):
    data = []
    file = None
    with open(filename) as file:
        # skip header
        next(file)

        # loop through elements
        for line in file:
            data.append(line_to_data(line))
    return data
# retourne le nombre d'entrer qui sont unique


def count_unique(array):
    return len(set(array))

# Methode pour dessiner/grapher des donnee.


def make_histogramme(array, axe):
    nbins = count_unique(array)
    arr = np.array(array)
    axe.hist(arr, bins=int(nbins/4))


def make_boxplot(array, axe):
    arr = np.array(array)
    axe.boxplot(arr)


def make_droite_henry(data, axe):
    # Create the normal probability plot
    stats.probplot(data, plot=axe)
# tests d'hypothese


def tester_moyenne(data1, data2):
    t_stat, pval = stats.ttest_ind(data1, data2)
    return f't_stat : {t_stat}, p = {pval}'


def tester_variance(data1, data2):
    t_stat, pval = stats.f_oneway(data1, data2)
    return f't_stat : {t_stat}, p = {pval}'
# methode pour les statistique descriptive


def describe(data):
    df = pd.DataFrame(data)
    interval = stats.norm.interval(confidence=0.95,
                                   loc=np.mean(data),
                                   scale=stats.sem(data))
    description = df.describe(include="all").to_dict()[0]
    description["interv"] = interval
    retval = ""
    for x in description.keys():
        retval += f'{x}\t: {description[x]}\n'
    return retval


def main():
    separator = "-"*70 + "\n"
    # initialisation
    # script dependament de l'os
    script =  "./charger.sh" if (platform.system() != 'Windows') else "./charger.ps1"
    subprocess.run(script)
    data = load_data("output.csv")
    fig, axes = plt.subplots(2, 2)

    # partie a)
    sales = [x.sales for x in data]

    make_histogramme(sales, axes[0][0])
    make_boxplot(sales, axes[0][1])
    make_droite_henry(sales, axes[1][0])

    plt.ioff()
    plt.savefig("out/question_a.png")
    shapiro = stats.shapiro(sales)
    with open("out/partie_a.txt", 'w') as f:
        f.write("shapiro wilk :\n")
        f.write(f"stats = {shapiro.statistic} , p = {shapiro.pvalue}\n")
        f.write(separator)
        f.write("stat descriptive: \n")
        f.write(describe(sales))
    plt.clf()

    # partie b
    # preparation des donnes
    sales_urbain = []
    sales_rural = []
    for x in data:
        if x.region == 0:
            sales_rural.append(x.sales)
        else:
            sales_urbain.append(x.sales)
    fig, axes = plt.subplots(2, 2)
    make_boxplot(sales_rural, axes[1][0])
    make_boxplot(sales_urbain, axes[1][1])
    axes[1][0].set_title("Tukey Rural")
    axes[1][1].set_title("Tukey Urbain")

    make_histogramme(sales_rural, axes[0][0])
    make_histogramme(sales_urbain, axes[0][1])
    axes[0][0].set_title("Histogramme Rural")
    axes[0][1].set_title("Histogramme Urbain")

    with open("out/partie_b.txt", "w") as f:
        f.write(separator*2)
        f.write("Stat descriptive:\n")
        f.write("rural : \n")
        f.write(separator)
        f.write(describe(sales_rural))
        f.write("urbain :\n")
        f.write(separator)
        f.write(describe(sales_urbain))
        f.write(separator*2)
        f.write("test d'hypothese sur les variances\n")
        f.write(tester_variance(sales_urbain, sales_rural))
        f.write(separator*2)
        f.write("test d'hypothese sur les moyennes\n")
        f.write(tester_moyenne(sales_urbain, sales_rural))
    plt.savefig("out/partie_b.png")

if __name__ == "__main__":
    main()
