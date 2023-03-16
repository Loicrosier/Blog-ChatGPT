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

  def name_without_char
    name.gsub('?', '') unless name.nil? || name.gsub('?', '').nil?
    name.gsub('"', '') unless name.nil? || name.gsub('"', '').nil?
  end

  def content_with_good_format
    content.gsub!('"', '') unless content.gsub!('"','').nil?
    paragraphes = content.split("\n\n").map(&:strip)
    paragraphes.map! { |paragraphe| paragraphe = "<p>#{paragraphe}</p>" }.shift
    taille = paragraphes.size
    pub = "<div class='ads' ></div>"
    if paragraphes.count > 1
      paragraphes.insert(0, pub) && paragraphes.insert((0 + taille) / 2, pub) && paragraphes.insert(taille, pub)
    else
      paragraphes.insert(0, pub)
    end


    return paragraphes
  end

  def self.check_questions(questions, sous_category)
    questions = questions[0]
    sous_category = SousCategory.find(sous_category)
    already_exist = false
    bad_questions = []
    breaker = false
    post_question_exist = Post.all.map { |post| post.name }

    while breaker == false do
      questions.each do |question|
        if post_question_exist.include?(question)
          bad_questions << question
        end
      end
      questions = questions - bad_questions
       question = "Donne moi un liste de 10 questions en rapport avec ce sujet #{sous_category.name} aucune des questions dois être égale ou vraiment similaires a un des elements de bad_question = #{bad_questions.to_s} avant de me fournir cette liste vérifie bien qu'aucune des questions que tu vas me fournir est présente dans bad_question retourne moi uniquement la liste sous formes de string séparé par des virgule"
       questions += get_openai_response(question, 1000).split(",").map(&:strip!)
        questions.each do |question|
          if post_question_exist.include?(question)
            already_exist = true
            bad_questions << question
          end
        end
        p questions = questions - bad_questions
        breaker = questions.count >= 10 && already_exist == false
    end
    return questions - bad_questions
  end

  # method pour effectuer les requetes a lapi openAI appel la class RateLimitedClient pour faire requete avec systeme backoff
  def self.get_openai_response(string, max_tokens)
  client = RateLimitedClient.new(API_KEY)
  response = client.request('/v1/engines/davinci-codex/completions', string, max_tokens)
  return response
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

      # call function check if question already answered or number of question is to much
      questions_checked = check_questions(questions, questions[1])

      questions_checked.each do |question|
        question_to_article = "Ecris un article pour répondre a cette question #{question} cette article dois remplir une page répond moi juste l'article sous forme de string chaque phrases ou mots important de l'article dois etre englober dans une balise span avec la class 'strong-words' "
        post_content = get_openai_response(question_to_article, 1000)
        # check if article already exist if already do nothing
        if Post.where(question: question).empty?
          # name witohut "
          p Post.create(name: question, content: post_content, question: question, sous_category_id: id_of_sous_category)
        end
      end
    end

    # destroy article nil
    Post.where(name: nil).each { |post| p "destroy #{post.destroy} " }
    Post.where(name: name.size < 20 ).each { |post| p "destroy #{post.destroy} " }

  end


end
