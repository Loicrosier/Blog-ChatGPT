namespace :create_article do
  desc "Création des Posts automatique"
  task generate_article: :environment do
    Post.create_article
  end
end
