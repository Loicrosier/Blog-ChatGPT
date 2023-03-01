# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'categories:'

Category.create(name: 'Finance')
Category.create(name: 'Santé')
Category.create(name: 'Technologie')
Category.create(name: 'Voyages')
Category.create(name: 'Droit')


p 'sous categorie'

SousCategory.create(name: 'Pret', category_id: 1 )
SousCategory.create(name: 'Carte de Crédit', category_id: 1 )
SousCategory.create(name: 'Investissements', category_id: 1 )
SousCategory.create(name: 'Compte Epargne', category_id: 1 )
SousCategory.create(name: 'Assurance', category_id: 1 )

SousCategory.create(name: 'Annonce Médicament', category_id: 2 )
SousCategory.create(name: 'Traitements', category_id: 2 )
SousCategory.create(name: 'Régimes', category_id: 2 )
SousCategory.create(name: 'Soins de Santé', category_id: 2 )

SousCategory.create(name: 'Smartphones', category_id: 3 )
SousCategory.create(name: 'Ordinateurs', category_id: 3 )
SousCategory.create(name: 'Applications', category_id: 3 )
SousCategory.create(name: 'Logiciels', category_id: 3 )
SousCategory.create(name: 'Jeux-Vidéos', category_id: 3 )

SousCategory.create(name: 'Meilleurs Destinations', category_id: 4 )
SousCategory.create(name: 'Idées a faires', category_id: 4 )

SousCategory.create(name: 'Avocats', category_id: 5 )
SousCategory.create(name: 'Service Juridiques', category_id: 5 )
SousCategory.create(name: 'Litiges', category_id: 5 )
SousCategory.create(name: 'Assurances', category_id: 5 )
