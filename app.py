import tkinter as tk
from bdd import Bdd

class Page():

    def __init__(self):
        self.container = tk.Frame(app_frame, bg=colors["Bleu"])
    
    # Méthode pour cacher la frame
    def close_frame(self):
        self.container.pack_forget()

    # Méthode pour montrer la frame
    def show_frame(self):
        self.container.pack(expand='yes')

class MainPage(Page):

    def __init__(self):
        super().__init__()
        # Les différentes frames
        self.title = tk.Frame(self.container, bg=colors["Bleu"])
        self.btn = tk.Frame(self.container, bg=colors["Bleu"])
        # Les deux titres
        self.app_title = tk.Label(self.title, text='IKEO', font=('Helvetica', 40), bg=colors["Bleu"], fg=colors["Jaune"]).pack(expand='yes', pady=8)
        self.app_subtitle = tk.Label(self.title, text='Bienvenue sur votre interface. Que voulez-vous faire ?', font=('Helvetica', 14), bg=colors["Bleu"], fg=colors["Jaune"]).pack(expand='yes')
        # Les deux boutons
        self.btn_show_products = tk.Button(self.btn, text='Produits', bg=colors["Bleu"], fg=colors["Jaune"], height=1, width=12, relief='flat', command=lambda:[self.close_frame(), products.show_frame()]).pack(pady=10)
        self.btn_add_bus = tk.Button(self.btn, text='Sites de Prod', bg=colors["Bleu"], fg=colors["Jaune"], height=1, width=12, relief='flat', command=lambda:[self.close_frame(), sites.show_frame()]).pack()
        # Affichage des frames
        self.title.pack(expand='yes', pady=25)
        self.btn.pack(expand='yes')

class ProductsPage(Page):

    def __init__(self):
        super().__init__()
        # Les différentes frames
        self.title = tk.Frame(self.container, bg=colors["Bleu"])
        self.display = tk.Frame(self.container, bg=colors["Bleu"])
        self.btn_frame = tk.Frame(self.container, bg=colors["Bleu"])
        # Titre
        self.page_title = tk.Label(self.title, text='Choisissez un produit', font=('Helvetica', 40), bg=colors['Bleu'], fg=colors["Jaune"]).pack(expand='yes', pady=40)
        # Option Menu pour choisir parmis la liste des produits
        self.products = self.recup_prod_name()
        self.var = tk.StringVar()
        self.var.trace("w", self.update_prod_infos)
        self.var.set("Liste des produits")
        self.opt_menu = tk.OptionMenu(self.display, self.var, *self.products)
        self.opt_menu.grid(row=0, pady=40)
        self.product_infos = tk.Label(self.display, text='', font=('Helvetica', 12))
        self.product_infos.grid(row=1)
        # Bouton home
        self.btn_home = tk.Button(self.btn_frame, image=homebtn, bg="white", fg=colors["Jaune"], relief='flat', height=20, width=20, command=lambda:[self.close_frame(), main.show_frame()]).grid(row=1, pady=50)
        # Affichage des frames
        self.title.pack(expand='yes')
        self.display.pack(expand='yes')
        self.btn_frame.pack(expand='yes')

    def recup_prod_name(self):
        self.products = Bdd.recup_products()
        self.prod_names = []
        for product in self.products.keys():
            self.prod_names.append(product)
        return self.prod_names

    def recup_prod_infos(self, product):
        if product != 'Liste des produits':
            self.products = Bdd.recup_products()
            self.usines = Bdd.recup_site_prod(self.products[product][0])
            if len(self.usines) > 1:
                return f"{product} | réf: {self.products[product][1]} | {self.products[product][2]} | produit dans les usines de {', '.join(self.usines)}"
            else :
                return f"{product} | réf: {self.products[product][1]} | {self.products[product][2]} | produit dans l'usine de {self.usines[0]}"

    def update_prod_infos(self, *args):
        self.infos_text = self.recup_prod_infos(self.var.get())
        self.product_infos.config(text=f'{self.infos_text}')
        
class SitesPage(Page):

    def __init__(self):
        super().__init__()
        # Les différentes frames
        self.title = tk.Frame(self.container, bg=colors["Bleu"])
        self.display = tk.Frame(self.container, bg=colors["Bleu"])
        self.btn_frame = tk.Frame(self.container, bg=colors["Bleu"])
        # Titre
        self.page_title = tk.Label(self.title, text='Tous nos sites de production', font=('Helvetica', 40), bg=colors['Bleu'], fg=colors["Jaune"]).pack(expand='yes', pady=40)
        self.update_usines_infos()
        # Bouton home
        self.btn_home = tk.Button(self.btn_frame, image=homebtn, bg="white", fg=colors["Jaune"], relief='flat', height=20, width=20, command=lambda:[self.close_frame(), main.show_frame()]).grid(row=1, pady=50)
        # Affichage des frames
        self.title.pack(expand='yes')
        self.display.pack(expand='yes')
        self.btn_frame.pack(expand='yes')

    def update_usines_infos(self):
        self.usines = Bdd.recup_sites()
        print(self.usines)
        for i, v in enumerate(self.usines.values()):
            text = f' Site de {v[0]}, {v[1]} à {v[2]}\n'
            self.usines_infos = tk.Label(self.display, text=text, font=('Helvetica', 12)).grid(row=i)

# Couleurs
colors = {"Bleu":"#0051BA", "Jaune":"#FFDA1A"}

# Fenêtre de l'app
root = tk.Tk()
root.title("IKEO APP")
root.geometry("1000x600")
root.config(bg=colors["Bleu"])

# Images
homebtn = tk.PhotoImage(file="./home.png")

#Frame principale
app_frame = tk.Frame(root, bg=colors["Bleu"])
app_frame.pack(expand='yes')

main = MainPage()
products = ProductsPage()
products.close_frame()
sites = SitesPage()
sites.close_frame()

main.show_frame()

root.mainloop()