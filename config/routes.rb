Rails.application.routes.draw do
  get "carts/show"
  resources :products
  
  # カート機能のルーティング
  resource :cart, only: [:show] do
    post 'add_item/:product_id', to: 'carts#add_item', as: 'add_item'
    # 追加：合言葉をチェックするアクション
    post 'checkout', to: 'carts#checkout'
    # 追加：世界が救われた時の画面
    get 'ending', to: 'carts#ending'
  end
  
  def checkout
    # 1. カート内の商品IDを数値に変換して取得
    cart_ids = (session[:cart] || []).map(&:to_i)
    
    # 2. 神器のIDを設定（さっき確認した [2, 3, 4] に合わせるニャ！）
    required_ids = [2, 3, 4] 
    
    # 3. 入力された合言葉を取得
    password = params[:password]

    # 4. 判定ロジック
    if (required_ids - cart_ids).empty? && password == "Railsで世界を救うニャ！"
      # 条件クリア！セッションを空にしてエンディングへ
      session[:cart] = []
      redirect_to ending_cart_path
    else
      # 失敗...普通の購入として処理
      session[:cart] = []
      redirect_to root_path, notice: "お買い上げありがとうニャ！世界は今日も平和だニャ。"
    end
  end

  def ending
    # エンディング画面を表示するだけのアクション
  end
  root "products#index"
end

