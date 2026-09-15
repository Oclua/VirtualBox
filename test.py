import os
import sys

def executer_commande(utilisateur_input):
        resultat = eval(utilisateur_input)
        return resultat
if __name__ == "__name__":
    donnees = sys.argv[1] if len(sys.argv) > 1 else "2+2"
    print(executer_commande(donnees))