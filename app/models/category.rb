class Category < ApplicationRecord
  # require 'dotenv/load'
  require 'cloudinary'
  require 'open-uri'
  has_many :sous_categories, dependent: :destroy
  has_one_attached :image


  def capitalize
    return name.capitalize!
  end

  private

  def self.attach_image
    # image_path = '/chemin/vers/mon/image.jpg'
    # result = Cloudinary::Uploader.upload(image_path)
    image = URI.open('https://res.cloudinary.com/dtv4zvyjx/image/upload/v1677453124/forum%20with%20ChatGPT/groupe-personnel-medical-portant-icones-liees-sante_53876-43071_kq5nhv.avif').read
    # binmode pour conserver les caracteres de départ et fin de fichier
    # rewind pour remetre le flux a 0 apres lecture ou ecriture pour pouvoir etre relu du depart du fichier
    categories = Category.all
    categories.each do |category|
      category.image.attach(io: StringIO.new(image), filename: "image.avif", content_type: "image/avif")
    end
    # Suppression de l'objet Tempfile
  end

end
