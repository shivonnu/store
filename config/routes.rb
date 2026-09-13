Rails.application.routes.draw do
  resources :products

  resource :cart, only: [ :show ] do
    post "add_item/:product_id", to: "carts#add_item", as: :add_item
    post :checkout
    get :ending
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "products#index"
end
