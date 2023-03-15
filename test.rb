# require 'net/http'
# require 'uri'
# require 'json'
# require 'dotenv/load'

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




















a = "Investir de l'argent peut être une excellente façon de générer des rendements supplémentaires et de se préparer pour l'avenir. Cependant, il est important de comprendre que l'investissement peut être risqué et que tous les investisseurs ne parviennent pas à obtenir des rendements élevés. Par conséquent, avant de commencer à investir, vous devez prendre le temps de comprendre les différents types de placements et de déterminer lequel répond le mieux à vos objectifs financiers."
p a.size
# nbr = a.size

# p a.each {|e| p e}
# i = 0
# nbr.times do
#   p a[i+2] unless a[i+2].nil?
#   a.insert(i+2, ("<div class='ads'></div>"
#   i+=2
# end
# # a.reject! { |e| e.nil? }
# # p a
# a.split("\n\n").map{ |p| "<p>#{p.strip}</p>" }
