RATE_LIMIT = 30 # Nombre maximal de requêtes par minute
RATE_LIMIT_PERIOD = 60 # Durée de la période de limitation en secondes

class RateLimitedClient
  def initialize(api_key)
    @api_key = api_key
    @last_request_time = Time.now - RATE_LIMIT_PERIOD # initialiser le dernier temps de requête à RATE_LIMIT_PERIOD secondes avant l'heure actuelle
  end

  def request(path, *params)
    response = nil
    loop do
      # Attendre si la limite de taux d'appel a été atteinte
      wait_if_rate_limited

      # Envoyer la requête à l'API OpenAI
      uri = URI("https://api.openai.com/v1/completions")
      req = Net::HTTP::Post.new(uri)
      req['Authorization'] = "Bearer #{ENV['OPENAI_API_KEY']}"
      req['Content-Type'] = 'application/json'
      req.body = {
        prompt: params[0],
        model: 'text-davinci-003',
        temperature: 0.7,
        max_tokens: params[1]
      }.to_json

      http = Net::HTTP.new(uri.hostname, uri.port)
      http.use_ssl = true
      response = http.request(req)

      # Vérifier le code de statut de la réponse
      if response.code == '200'
        # Si la réponse est bonne, sortir de la boucle
        break
      elsif response.code == '429'
        # Si la réponse indique une limitation de taux d'appel, attendre et réessayer
        puts "Taux d'appel limité, attendez #{RATE_LIMIT_PERIOD} secondes ..."
        sleep(RATE_LIMIT_PERIOD)
      else
        # Si la réponse est invalide, lever une exception
        raise StandardError, "Erreur de l'API OpenAI: #{response.code} #{response.body}"
      end
    end

    return JSON.parse(response.body)['choices'][0]["text"]
  end

  private

  def wait_if_rate_limited
    # Calculer le temps restant avant que la prochaine requête puisse être envoyée
    elapsed_time = Time.now - @last_request_time
    time_remaining = RATE_LIMIT_PERIOD - elapsed_time
    if time_remaining > 0
      # Attendre le temps restant avant d'envoyer la prochaine requête
      sleep(time_remaining)
    end
  end
end
