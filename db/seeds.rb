require 'open-uri'
require 'dotenv/load'
    Cloudinary.config do |config|
      config.cloud_name = ENV['CLOUDINARY_CLOUD_NAME']
      config.api_key = ENV['CLOUDINARY_API_KEY']
      config.api_secret = ENV['CLOUDINARY_API_SECRET']
      config.secure = true
    end

p 'categories:'
img_finance = URI.open('https://res.cloudinary.com/dtv4zvyjx/image/upload/v1677881298/forum%20with%20ChatGPT/money-idea-business-man-bulb-capital-1586313-pxhere.com_ct27zf.jpg')
img_droit = URI.open('https://res.cloudinary.com/dtv4zvyjx/image/upload/v1677881298/forum%20with%20ChatGPT/4_copia_on35sd.png')
img_tech = URI.open('https://res.cloudinary.com/dtv4zvyjx/image/upload/v1677890242/forum%20with%20ChatGPT/technologie_bx2bhp.jpg')
img_sante = URI.open('https://res.cloudinary.com/dtv4zvyjx/image/upload/v1677881298/forum%20with%20ChatGPT/sant%C3%A9_humaine_m4udnr.png')
img_voyage = URI.open('https://res.cloudinary.com/dtv4zvyjx/image/upload/v1677890242/forum%20with%20ChatGPT/voyages_oz9ult.jpg')

category_1 = Category.new(name: 'Finance')
category_1.image.attach(io: img_finance, filename: 'image.jpg', content_type: "image/jpg")
category_2 = Category.new(name: 'Santé')
category_2.image.attach(io: img_sante, filename: 'image.jpg', content_type: "image/jpg")
category_3 = Category.new(name: 'Technologie')
category_3.image.attach(io: img_tech, filename: 'image.jpg', content_type: "image/jpg")
category_4 = Category.new(name: 'Voyages')
category_4.image.attach(io: img_voyage, filename: 'image.jpg', content_type: "image/jpg")
category_5 = Category.new(name: 'Droit')
category_5.image.attach(io: img_droit, filename: 'image.jpg', content_type: "image/jpg")

category_1.save
category_2.save
category_3.save
category_4.save
category_5.save

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
