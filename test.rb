# require 'net/http'
# require 'uri'
# require 'json'
require 'dotenv/load'

#       phrase = "Quelles sont les questions les plus fréquemment posées sur medicaments dans la categorie santé ?
#        retourne moi uniquement une string des 20 questions fréquemment posées séparé par des virgules"

# uri = URI("https://api.openai.com/v1/completions")

# req = Net::HTTP::Post.new(uri)
# req['Authorization'] = "Bearer #{ENV['OPENAI_API_KEY']}"
# req['Content-Type'] = 'application/json'
# req.body = {
#   prompt: phrase,
#   model: 'text-davinci-003',
#   temperature: 0.7,
#   max_tokens: 100
# }.to_json

# http = Net::HTTP.new(uri.hostname, uri.port)
# http.use_ssl = true
# response = http.request(req)

# json = JSON.parse(response.body)
# a= json['choices'][0]['text'].split(",").map(&:strip!)
# a.pop
# puts a






# require_relative 'config/environment'
#   def check_questions(questions)
#     already_exist = false
#     bad_questions = []
#     breaker = false
#     post_question_exist = Post.all.map { |post| post.name }
#     p "############################################"
#     p "############################################"
#         p "############################################"
#     while breaker == false do
#       questions.each do |question|
#         if post_question_exist.include?(question)
#           bad_questions << question
#         end
#       end
#         questions = questions - bad_questions

#        question = "regenere moi une liste de 10 questions toujours similaires a cette liste de questions #{questions.to_s}, (des questions du meme type) que les gens se posent le plus la liste ne dois pas contenir les questions parmis ce tableau #{bad_questions.to_s} répond uniquement par la liste des 10 questions séparé par des virgules"
#        questions += Post.get_openai_response(question, 1000).split(",").map(&:strip!)
#         questions.each do |question|
#           if post_question_exist.include?(question)
#             already_exist = true
#             bad_questions << question
#           end
#         end
#         p questions = questions - bad_questions
#        p breaker = questions.count >= 10 && already_exist == false
#     end
#     return questions - bad_questions
#   end

  a = ["\"Comment obtenir un prêt personnel ?", "Quelle est la différence entre un prêt à taux fixe et un prêt à taux variable ?", "Quels sont les critères d'éligibilité pour un prêt ?", "Quels sont les types de prêts disponibles sur le marché ?", "\"Quels sont les avantages et les inconvénients d'un prêt personnel ?\"", "\"Quel est le montant maximum que je peux emprunter pour un prêt personnel ?\"", "\"Comment puis-je savoir si je suis éligible pour un prêt personnel ?\"", "\"Comment puis-je trouver le meilleur prêt personnel ?\"", "\"Quels sont les risques liés à l’utilisation d’un prêt personnel ?\"", "\"Existe-t-il des moyens d'obtenir un prêt personnel sans intérêt ?\"", "\"Comment puis-je obtenir un prêt personnel si je n'ai pas un bon score de crédit ?\"", "\"Comment puis-je rembourser un prêt personnel ?", "\"Quel est le taux d'intérêt d'un prêt personnel ?\"", "\"Quelle est la procédure d'obtention d'un prêt personnel ?\"", "\"Quelles sont les garanties requises pour un prêt personnel ?\"", "\"Comment puis-je utiliser un prêt personnel ?\"", "\"Comment puis-je économiser de l'argent en obtenant un prêt personnel ?\"", "\"Comment puis-je comparer les offres de prêt personnel ?\"", "\"Quelles sont les conséquences d'un prêt personnel non remboursé ?\"", "\"Quels sont les documents requis pour obtenir un prêt personnel ?\"", "\"Comment puis-je trouver un prêt personnel à un taux d'intérêt favorable ?\"", "\"Quels sont les types de frais associés à un prêt personnel ?\"", "\"Quel est le délai de remboursement d'un prêt personnel ?\"", "\"Quel est le montant minimum que je peux emprunter pour un prêt personnel ?\"", "\"Comment puis-je trouver le meilleur taux d'intérêt pour un prêt personnel ?\"", "\"Quelles sont les garanties requises pour un prêt personnel ?\"", "\"Quelles sont les conséquences d'un prêt personnel non remboursé ?\"", "\"Comment puis-je obtenir un prêt personnel si je n'ai pas un bon score de crédit ?\"", "\"Comment puis-je trouver un prêt personnel à un taux d'intérêt favorable ?\"", "\"Comment puis-je comparer les offres de prêt personnel ?\"", "\"Quelle est la procédure pour obtenir un prêt personnel ?", "\"Quel est le montant maximum que je peux emprunter pour un prêt personnel ?\"", "\"Comment puis-je savoir si je suis éligible pour un prêt personnel ?\"", "\"Comment puis-je trouver le meilleur prêt personnel ?\"", "\"Quels sont les risques liés à l’utilisation d’un prêt personnel ?\"", "\"Existe-t-il des moyens d'obtenir un prêt personnel sans intérêt ?\"", "\"Comment puis-je rembourser un prêt personnel ?\"", "\"Quel est le taux d'intérêt d'un prêt personnel ?\"", "\"Quelles sont les garanties requises pour un prêt personnel ?\"", "\"Comment puis-je utiliser un prêt personnel ?\"", "\"Comment puis-je économiser de l'argent en obtenant un prêt personnel ?\"", "\"Quelle est la différence entre un prêt à taux fixe et un prêt à taux variable ?\"", "\"Quels sont les critères d'éligibilité pour un prêt ?\"", "\"Quels sont les types de prêts disponibles sur le marché ?\"", "\"Quels sont les avantages et les inconvénients d'un prêt personnel ?\"", "\"Quel est le montant maximum que je peux emprunter pour un prêt personnel ?\"", "\"Comment puis-je savoir si je suis éligible pour un prêt personnel ?\"", "\"Comment puis-je trouver le meilleur prêt personnel ?\"", "\"Quels sont les risques liés à l’utilisation d’un prêt personnel ?\"", "\"Existe-t-il des moyens d'obtenir un prêt personnel sans intérêt ?\"", "\"Comment puis-je obtenir un prêt personnel si je n'ai pas un bon score de crédit ?\"", "\"Comment puis-je trouver un prêt personnel à un taux d'intérêt favorable ?\""]
  # b =  check_questions(a)


  bad_question = ["\"Comment obtenir un prêt personnel ?", "Quelle est la différence entre un prêt à taux fixe et un prêt à taux variable ?", "Quels sont les critères d'éligibilité pour un prêt ?", "Quels sont les types de prêts disponibles sur le marché ?", "\"Quels sont les avantages et les inconvénients d'un prêt personnel ?\"", "\"Quel est le montant maximum que je peux emprunter pour un prêt personnel ?\"", "\"Comment puis-je savoir si je suis éligible pour un prêt personnel ?\"", "\"Comment puis-je trouver le meilleur prêt personnel ?\"", "\"Quels sont les risques liés à l’utilisation d’un prêt personnel ?\"", "\"Existe-t-il des moyens d'obtenir un prêt personnel sans intérêt ?\"", "\"Comment puis-je obtenir un prêt personnel si je n'ai pas un bon score de crédit ?\"", "\"Comment puis-je rembourser un prêt personnel ?", "\"Quel est le taux d'intérêt d'un prêt personnel ?\"", "\"Quelle est la procédure d'obtention d'un prêt personnel ?\"", "\"Quelles sont les garanties requises pour un prêt personnel ?\"", "\"Comment puis-je utiliser un prêt personnel ?\"", "\"Comment puis-je économiser de l'argent en obtenant un prêt personnel ?\"", "\"Comment puis-je comparer les offres de prêt personnel ?\"", "\"Quelles sont les conséquences d'un prêt personnel non remboursé ?\"", "\"Quels sont les documents requis pour obtenir un prêt personnel ?\"", "\"Comment puis-je trouver un prêt personnel à un taux d'intérêt favorable ?\"", "\"Quels sont les types de frais associés à un prêt personnel ?\"", "\"Quel est le délai de remboursement d'un prêt personnel ?\"", "\"Quel est le montant minimum que je peux emprunter pour un prêt personnel ?\"", "\"Comment puis-je trouver le meilleur taux d'intérêt pour un prêt personnel ?\"", "\"Quelles sont les garanties requises pour un prêt personnel ?\"", "\"Quelles sont les conséquences d'un prêt personnel non remboursé ?\"", "\"Comment puis-je obtenir un prêt personnel si je n'ai pas un bon score de crédit ?\"", "\"Comment puis-je trouver un prêt personnel à un taux d'intérêt favorable ?\"", "\"Comment puis-je comparer les offres de prêt personnel ?\"", "\"Quelle est la procédure pour obtenir un prêt personnel ?", "\"Quel est le montant maximum que je peux emprunter pour un prêt personnel ?\"", "\"Comment puis-je savoir si je suis éligible pour un prêt personnel ?\"", "\"Comment puis-je trouver le meilleur prêt personnel ?\"", "\"Quels sont les risques liés à l’utilisation d’un prêt personnel ?\"", "\"Existe-t-il des moyens d'obtenir un prêt personnel sans intérêt ?\"", "\"Comment puis-je rembourser un prêt personnel ?\"", "\"Quel est le taux d'intérêt d'un prêt personnel ?\"", "\"Quelles sont les garanties requises pour un prêt personnel ?\"", "\"Comment puis-je utiliser un prêt personnel ?\"", "\"Comment puis-je économiser de l'argent en obtenant un prêt personnel ?\"", "\"Quelle est la différence entre un prêt à taux fixe et un prêt à taux variable ?\"", "\"Quels sont les critères d'éligibilité pour un prêt ?\"", "\"Quels sont les types de prêts disponibles sur le marché ?\"", "\"Quels sont les avantages et les inconvénients d'un prêt personnel ?\"", "\"Quel est le montant maximum que je peux emprunter pour un prêt personnel ?\"", "\"Comment puis-je savoir si je suis éligible pour un prêt personnel ?\"", "\"Comment puis-je trouver le meilleur prêt personnel ?\"", "\"Quels sont les risques liés à l’utilisation d’un prêt personnel ?\"", "\"Existe-t-il des moyens d'obtenir un prêt personnel sans intérêt ?\"", "\"Comment puis-je obtenir un prêt personnel si je n'ai pas un bon score de crédit ?\"", "\"Comment puis-je trouver un prêt personnel à un taux d'intérêt favorable ?\"", "\"Comment puis-je comparer les offres de prêt personnel ?\"", "\"Quelles sont les conséquences d'un prêt personnel non remboursé ?\"", "\"Quelles sont les garanties requises pour un prêt personnel ?\"", "\"Quels sont les documents requis pour obtenir un prêt personnel ?\"", "\"Quel est le taux d'intérêt d'un prêt personnel ?\"", "\"Quel est le délai de remboursement d'un prêt personnel ?\"", "\"Quel est le montant minimum que je peux emprunter pour un prêt personnel ?\"", "\"Comment puis-je trouver le meilleur taux d'intérêt pour un prêt personnel ?\"", "\"Quelles sont les types de frais associés à un prêt personnel ?\"", "\"Comment puis-je économiser de l'argent en obtenant un prêt personnel ?\""]
  p "good - bad #{a - bad_question}"
