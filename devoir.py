class Data:
    def __init__(self, num, vente, prix, publicite, region):
        self.num = num
        self.sales = round(vente,2)
        self.price = round(prix,2)
        self.advertising = round(publicite,2)
        self.region = region
    def __str__(self) -> str:
        return f'{self.sales}, {self.price}, {self.advertising} , {self.region}'

def line_to_data(line):
    info = line.split(";")
    num  =int(info[0])
    vente = float(info[1].replace(",",".")) * 1000
    price = float(info[2].replace(",","."))
    ads = float(info[3].replace(",",".")) * 1000
    region = int(info[4])
    return Data(num, vente, price, ads, region)


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

data = load_data("DevoirDH23.csv")
for item in data :
    print(item)

