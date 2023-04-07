import numpy as np
from scipy import stats
from matplotlib import pyplot as plt
import pandas as pd
### Methodes pour lire les donnees
## class qui contient les donne d'un echantillon
class Data:
    def __init__(self, num, vente, prix, publicite, region):
        self.num = num
        self.sales = round(vente,2)
        self.price = round(prix,2)
        self.advertising = round(publicite,2)
        self.region = region
    def __str__(self) -> str:
        return f'{self.sales}, {self.price}, {self.advertising} , {self.region}'
## methode pour convertir une ligne de csv (utilisant ; comme separateur)
def line_to_data(line):
    info = line.split(";")
    num  =int(info[0])
    vente = float(info[1].replace(",",".")) * 1000
    price = float(info[2].replace(",","."))
    ads = float(info[3].replace(",",".")) * 1000
    region = int(info[4])
    return Data(num, vente, price, ads, region)
## method qui retourne une liste des donnee a partir du fichier
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
## retourne le nombre d'entrer qui sont unique
def count_unique(array):
    return len(set(array))

### Methode pour dessiner/grapher des donnee.
def make_histogramme(array,axe):
    nbins = count_unique(array)
    arr= np.array(array)
    axe.hist(arr,bins=int(nbins/4))

def make_boxplot(array, axe):
    arr = np.array(array)
    axe.boxplot(arr)

def make_droite_henry(data, axe):
    # Create the normal probability plot
    stats.probplot(data, plot=axe)
# methode pour les statistique descriptive
def describe(data):
    df = pd.DataFrame(data)
    interval = stats.norm.interval(confidence=0.90,
                 loc=np.mean(data),
                 scale=stats.sem(data))
    description = df.describe(include="all").to_dict()[0]
    description["interv"] = interval
    retval =""
    for x in description.keys():
        retval+=f'{x}\t: {description[x]}\n'
    return retval
def main():
    # initialisation 
    data = load_data("DevoirDH23.csv")
    fig,axes = plt.subplots(2,2)

    # partie a)
    sales = [x.sales for x in data]

    make_histogramme(sales,axes[0][0])
    make_boxplot(sales,axes[0][1])
    make_droite_henry(sales,axes[1][0])

    plt.ioff()
    plt.savefig("question_a")
    shapiro = stats.shapiro(sales)
    with open("partie_a",'w') as f :
        f.write("shapiro wilk :")
        f.write(f"stats = {shapiro.statistic} , p = {shapiro.pvalue}")
        f.write("----------------------------------")
        f.write("stat descriptive: ")
        f.write(describe(sales))
    plt.clf()

    #partie b
    #preparation des donnes
    sales_urbain = []
    sales_rural =[]
    for x in data:
        if x.region == 0 :
            sales_rural.append(x.sales)
        else :
            sales_urbain.append(x.sales)
    fig,axes = plt.subplots(1,2)
    make_boxplot(sales_rural, axes[0])
    make_boxplot(sales_urbain, axes[1])
    axes[0].set_title("rural")
    axes[1].set_title("urbain")
    plt.show()

if __name__ == "__main__":
    main()


