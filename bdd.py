import mysql.connector

class Bdd():

    @classmethod
    def connect(cls) :
        cls.bdd = mysql.connector.connect(user='dbadmin', password='150k60BRO', host='localhost', port= '3306', database='ikeo', raise_on_warnings=True)
        cls.cursor = cls.bdd.cursor()

    @classmethod
    def close(cls):
        cls.bdd.close()
        cls.cursor.close()

    @classmethod
    def commit(cls):
        cls.bdd.commit()

    @classmethod
    def recup_products(cls):
        cls.connect()
        cls.cursor.execute('''SELECT produits.id_produits, produits.nom, produits.reference, produits.description FROM produits''')
        products = cls.cursor.fetchall()
        dic_prod = {"Liste des produits":""}
        for p in products:
            dic_prod[p[1]] = (p[0], p[2], p[3])
        cls.close()
        return dic_prod
    
    @classmethod
    def recup_site_prod(cls, produit):
        cls.connect()
        cls.cursor.execute(f'''SELECT usines FROM site_prod JOIN produits_sites ON site_prod.id_usines = produits_sites.id_usine WHERE produits_sites.id_produits = {produit}''')
        usines = cls.cursor.fetchall()
        li_usines = []
        for usine in usines:
            li_usines.append(usine[0])
        cls.close()
        return li_usines

    @classmethod
    def recup_sites(cls):
        cls.connect()
        cls.cursor.execute(f'''SELECT site_prod.id_usines, site_prod.usines, site_prod.adresse, villes.ville FROM site_prod JOIN villes ON site_prod.ville = villes.id_ville''')
        usines = cls.cursor.fetchall()
        dic_usines = {}
        for usine in usines:
            dic_usines[usine[0]] = (usine[1], usine[2], usine[3])
        cls.close()
        return dic_usines