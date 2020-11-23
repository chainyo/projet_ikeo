import mysql.connector as mysqlpyth
import tkinter as tk

#Python se connecte sur la bdd
    
bdd = mysqlpyth.connect(user='root', 
    password='root', 
    host='localhost', 
    port="8081", 
    database='ikeo')

# récupèration du curseur 
cursor = bdd.cursor()

# chaine de cractères de la requête à exécuter
query="SELECT usines, adresse FROM site_prod;"

# exécute la requête grâce au curseur
cursor.execute(query)
site_production=cursor.fetchall()
print(site_production)


#utilisation de Tkinter pour interface graphique affichage de tous les sites de production
# Création de la fenêtre de l'application
root = tk.Tk()
# Définir un titre pour la fenêtre
root.title("AFFICHAGE DES SITES DE PRODUCTION IKEO")
# Définir la taille de la fenêtre 
root.geometry("400x400") # mettre les pixels suivant ce pattern 0pixels x 0pixels
# Définir la couleur du fond
root.configure(bg="black") # bg = background

# Définir une taille minimale
root.minsize(200, 200)
# Définir une taille maximale
root.maxsize(800, 800)


# Création d'une frame qui contiendra les titres
frame_titre = tk.Frame(root, bg="blue") # root est la fenêtre à laquelle la frame est rattachée

# Permet de l'insérer dans la fenêtre
frame_titre.pack()

# On définit le texte que l'on veut afficher dans notre frame
titre = tk.Label(frame_titre, text='AFFICHAGE DES SITES DE PRODUCTION IKEO', font=("Helvetica", 15), bg='blue', fg='black')
# text = le texte à afficher, font = définir une police particulière et sa taille, 
# bg = couleur de l'arrière plan, et fg = couleur du texte

# Il faut également lui dire de l'afficher dans la frame
titre.pack(pady=50, padx=50) 
# pady et padx sont des marges en pixels sur les axes y et x, 
# c'est-à-dire en vertical et en horizontal respectivement.
# Ces marges nous permettront de voir la couleur de la frame qui comprend notre texte.

frame_titre = tk.Frame(root, bg="blue")
frame_titre.pack()

#Nouvelle fenêtre qui contiendra les boutons
frame_bouton = tk.Frame(root, bg="blue")
frame_bouton.pack()

titre = tk.Label(frame_titre, text='Cliquez sur le bouton pour afficher.', font=("Helvetica", 20), bg='orange', fg='white')
titre.pack(pady=10, padx=10) 

def afficher():
    liste_site_prod.insert(0, site_production)


# Création du bouton
bouton = tk.Button(frame_bouton, text='AFFICHER', height=5, width=20, bd=0, bg='green', fg='black')
# height = permet de définir la hauteur du bouton, width = définir la largeur, 
# bd = pour lui dire que l'on veut un bouton sans bordure,
# command = permet de lui indiquer une fonction a exécuter lorsque l'utilisateur clique sur le bouton

# Il est possible de modifier les propriétés d'un bouton pour lui ajouter une commande
bouton.configure(command=afficher) # la fonction appelée ne prend pas d'arguments donc pas de ()

# Afficher le bouton dans la frame
bouton.pack()

# On créé une entry pour l'affichage des sites de production
liste_site_prod = tk.Entry(frame_bouton, width=150, justify="center", font=("Helvetica", 15), bg="pink", fg="black")
# justify = permet de définir comment le texte est justifié, soit "center", "left", "right"
# par défaut le texte est justifié à gauche

# Afficher l'entry dans la fenêtre
liste_site_prod.pack(pady=50, padx=50)



root.mainloop()


cursor.close()
bdd.close()
