require 'dotenv/load'
class Category < ApplicationRecord
  require 'net/http'
  require 'cloudinary'
  require 'open-uri'
  has_many :sous_categories, dependent: :destroy
  has_one_attached :image, dependent: :destroy


  def capitalize
    return name.capitalize!
  end

  private


end
