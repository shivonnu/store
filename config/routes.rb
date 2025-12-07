# config/routes.rb
Rails.application.routes.draw do
  # root "home#index"
  # 以下の行を追加します
  root "products#index" 

  resources :products
  # ... (その他のルーティング設定)
end