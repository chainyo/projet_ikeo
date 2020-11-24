import tkinter as tk
import mysql.connector as mysqlpyth


bdd = mysqlpyth.connect(user='root', 
password='root', 
host='localhost', 
port="8082", 
database='ikeo')

cursor = bdd.cursor()

root = tk.Tk()
root.title("Mon Application")
root.geometry("2000x1000")
root.configure(bg="black") 
# root.minsize(200, 200)
# root.maxsize(600, 600)
frame_titre = tk.Frame(root, bg="white")
frame_titre.pack()

 
titre = tk.Label(frame_titre, text='Ikeo', font=("Comic Sans MS", 20), bg='darkblue', fg='white')
titre.pack(pady=10, padx=10) 


# chaine de cractères de la requête à exécuter
#donnees = "SELECT id_produits, id_usine FROM produits_sites"
donnees = 'SELECT produits.nom, site_prod.usines FROM produits_sites INNER JOIN produits ON produits_sites.id_produits=produits.id_produits INNER JOIN site_prod ON produits_sites.id_usine=site_prod.id_usines'
cursor.execute(donnees)
prod_sites = cursor.fetchall()
dico = {}
for x in prod_sites:
    dico[x[0]] = dico.get(x[0], '') + f"{x[1]} "
print(dico)

resultat = ""
for cle,valeur in dico.items():
    resultat += f"{cle} : {valeur}\n"#pour faire retourner à la ligne

def afficher():
    liste_site.configure(text = resultat) # on remplace dico par resultat

frame_bouton = tk.Frame(root, bg="black")
frame_bouton.pack()
titre = tk.Label(frame_titre, text='affichage sites de production', font=("Comic Sans MS", 20), bg='darkblue', fg='white')
titre.pack(pady=10, padx=10) 
bouton = tk.Button(frame_bouton, text='appuyer pour apercevoir les sites', height=5, width=50, bd=0)

# Il est possible de modifier les propriétés d'un bouton pour lui ajouter une commande
bouton.configure(command=afficher) # la fonction appelée ne prend pas d'arguments donc pas de ()
# Afficher le bouton dans la frame
bouton.pack()

saisi = tk.Entry(frame_bouton, width=10, justify="center", font=("Comic Sans MS", 10), bg="white", fg="black")

# Afficher l'entry dans la fenêtre
saisi.pack()

# On créé un label pour l'affichage des sites de production
liste_site = tk.Label(frame_bouton, justify="center", font=("Comic Sans MS", 15), bg="green", fg="black")



# Afficher l'entry dans la fenêtre
liste_site.pack(pady=50, padx=50)

root.mainloop()




bdd.commit()
 
cursor.close()

bdd.close()