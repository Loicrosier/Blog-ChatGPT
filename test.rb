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




















content = "\n\nL'assurance est un moyen important pour protéger votre famille et vos biens contre une multitude de risques. Mais elle peut aussi être un poste de dépenses considérable et vous vous demandez peut-être combien vous devrez payer pour l'assurance ? Le coût moyen d'une assurance varie selon l'âge, le sexe, l'emplacement, le type d'assurance et le niveau de couverture. \n\n Afin de mieux comprendre le coût moyen d'une assurance, il est important de comprendre le type d'assurance dont vous avez besoin et les facteurs qui peuvent affecter le prix de votre police. Une assurance auto est l'un des types d'assurance les plus courants et peut être très coûteux. Les tarifs d'assurance auto varient en fonction de votre âge, sexe, emplacement et antécédents de conduite. Les jeunes conducteurs, par exemple, peuvent payer des montants plus élevés pour leur assurance auto, car ils sont considérés comme des conducteurs plus à risque. D'autres facteurs, tels que les antécédents de conduite et le type de voiture que vous conduisez, peuvent également affecter le coût de votre assurance auto.\n\n L'assurance habitation est une autre forme d'assurance courante, et elle est généralement moins coûteuse que l'assurance auto. Les tarifs d'assurance habitation dépendent de plusieurs facteurs, notamment le type de maison que vous possédez, son emplacement et le niveau de couverture dont vous avez besoin. L'emplacement de votre maison peut également affecter le coût de votre assurance habitation, car les maisons situées dans des régions à risque plus élevé peuvent entraîner des tarifs plus élevés.\n\n En plus de l'assurance auto et de l'assurance habitation, vous pouvez également être intéressé par d'autres types d'assurance, tels que l'assurance voyage, l'assurance santé et l'assurance vie. Les tarifs de ces types d'assurance peuvent varier considérablement en fonction de votre âge, de votre sexe, de votre emplacement, de votre état de santé et du niveau de couverture dont vous avez besoin.\n\n En conclusion, le coût moyen d'une assurance varie selon le type d'assurance dont vous avez besoin, l'âge, le sexe, l'emplacement et le niveau de couverture. Il est important de prendre le temps de comprendre le type d'assurance dont vous avez besoin et de comparer les tarifs d'assurance avant de prendre une décision."
paragraphes = content.split("\n\n").map(&:strip)
p paragraphes.map! { |paragraphe| paragraphe = "<p>#{paragraphe}</p>" }

array = [1, 2, 3, 4, 5, 6]

nbr = array.size
i = 0
nbr.times do
  array.insert(i, "<div class='ads'></div>")
  i+=2
end

p array
alphabet = "abcdefghijklmnopqrstuvwxyz"
 puts (alphabet[-8].uppercase * 2)





# nbr = a.size

# p a.each {|e| p e}
# i = 0
# nbr.times do
#   p a[i+2] unless a[i+2].nil?
#   a.insert(i+2, ("<div class='ads'></div>" unless a[i+2].nil?))
#   i+=2
# end
# # a.reject! { |e| e.nil? }
# # p a
# a.split("\n\n").map{ |p| "<p>#{p.strip}</p>" }
