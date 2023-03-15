# require 'faraday'
# require 'faraday_middleware'
require 'net/http'
require 'uri'
require 'json'
require 'dotenv/load'



class Post < ApplicationRecord

  # relation

  belongs_to :sous_category
  API_KEY = ENV['OPENAI_API_KEY']


  # method

  def content_with_good_format
    paragraphes = content.split("\n\n").map(&:strip)
    paragraphes.map! { |paragraphe| paragraphe = "<p>#{paragraphe}</p>" }.shift
    taille = paragraphes.size
    pub = "<div class='ads' ></div>"
    if paragraphes.count > 1
      paragraphes.insert(0, pub) && paragraphes.insert((0 + taille) / 2, pub) && paragraphes.insert(taille - 1, pub)
    else
      paragraphes.insert(0, pub)
    end


    return paragraphes
  end

  # method pour effectuer les requetes a lapi openAI appel la class RateLimitedClient pour faire requete avec systeme backoff
  def self.get_openai_response(string, max_tokens)
  client = RateLimitedClient.new(API_KEY)
  response = client.request('/v1/engines/davinci-codex/completions', string, max_tokens)
  response
  end


  def self.create_article
    sous_categories = SousCategory.all
    # tableau de tableau [[categoryname, souscategoryname, souscategoryid], [categoryname, souscategoryname, souscategoryid]]
    dictionnaire = []
    liste_de_questions = []

    # iterer sur les sous_categories pour recuperer le nom et le nom de leur category
    sous_categories.each do |sous_category|
      category = Category.find(sous_category.category_id)
      dictionnaire << [category.name, sous_category.name, sous_category.id]
    end

    dictionnaire.each do |mot|
      phrase = "Quelles sont les questions les plus fréquemment posées sur #{mot[1]} dans la categorie #{mot[0]} ? retourne moi uniquement une string des 10 questions les plus fréquemment posées séparé par des virgules"
      question_generer = get_openai_response(phrase, 100).split(",").map(&:strip!)
      question_generer.pop
      liste_de_questions << [question_generer, mot[2]]
    end

    liste_de_questions.each do |questions|
      id_of_sous_category = questions[1]
      questions[0].each do |question|
        question_to_article = "Ecris un article pour répondre a cette question #{question} cette article dois remplir une page répond moi juste l'article sous forme de string chaque phrases ou mots important de l'article dois etre englober dans une balise span avec la class 'strong-words' "
        content = get_openai_response(question_to_article, 1000)
        # check if article already exist if already do nothing
        if Post.where(question: question).empty?
         p Post.create(name: question, content: content, question: question, sous_category_id: id_of_sous_category)
        end
      end
    end

    # destroy article nil
    Post.where(name: nil).each { |post| p "destroy #{post.destroy} " }

  end


end
