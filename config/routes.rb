Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'categories#index'
  # show
  get "/categories/:id", to: "categories#show", as: :categorie
  get "/posts/:id", to: 'posts#show', as: :post

  # index
  get "sc/:sous_category_id/posts", to: 'posts#index', as: :sous_categories
end
