# For this solution, the Factory Method was used,
# thus creating other classes that work as subclasses of the main one.

# A class for the transactions and a method that checks what their risk is.
class ITrade:
    def __init__(self, value, client_sector):
        self.value = value
        self.clientSector = client_sector

    def calculate_risk(self, type_of_risk):
        return type_of_risk.risk(self)


# One class for each risk so rules are easy to maintain
class LowRisk:
    def risk(self, element):
        if element.value < 1000000 and element.clientSector == "Public":
            return True
        else:
            return False

    def __str__(self):
        return "LOWRISK"


class MediumRisk:
    def risk(self, element):
        if element.value > 1000000 and element.clientSector == "Public":
            return True
        else:
            return False

    def __str__(self):
        return "MEDIUMRISK"


class HighRisk:
    def risk(self, element):
        if element.value > 1000000 and element.clientSector == "Private":
            return True
        else:
            return False

    def __str__(self):
        return "HIGHRISK"


class Analyse:
    # Receive an input with the trades and then check which type of risk it belongs to and then store it.
    def categorize(self, input):
        trade_categories = []

        risks = [LowRisk(), MediumRisk(), HighRisk()]

        for element in input:
            for risk in risks:
                if element.calculate_risk(risk):
                    trade_categories.append(risk.__str__())
                    break
        return trade_categories


if __name__ == '__main__':
    analyse = Analyse()
    # Representing input with some transactions in a list
    trade1 = ITrade(2000000, "Private")
    trade2 = ITrade(400000, "Public")
    trade3 = ITrade(500000, "Public")
    trade4 = ITrade(3000000, "Public")
    portfolio = [trade1, trade2, trade3, trade4]

    output = analyse.categorize(portfolio)

    print("tradeCategories = ", output)
