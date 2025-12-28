
class CartsController < ApplicationController
  def show
    # セッションからカートの中身（商品IDの配列）を取得、なければ空配列
    @cart_item_ids = session[:cart] || []
    # IDから実際の商品データを取得
    @cart_products = Product.where(id: @cart_item_ids)
  end

  def add_item
    # セッションのカートを初期化、または既存のものを取得
    session[:cart] ||= []
    # 送られてきた商品IDをカートに追加
    session[:cart] << params[:product_id]
    
  def checkout
    # 1. カート内の商品IDを数値に変換して取得
    cart_ids = (session[:cart] || []).map(&:to_i)
    
    # 2. 正解の条件を設定 
    # ※ [★]がついた3つの商品のIDをここで指定します。
    required_ids = [2, 3, 4] 
    
    # 3. 入力された合言葉を取得
    password = params[:password]

    # 4. 判定！
    # 「神器が全てカートにある」かつ「合言葉が一致する」
    if (required_ids - cart_ids).empty? && password == "Railsで世界を救うニャ！"
      # 条件クリア！セッションを空にしてエンディングへ
      session[:cart] = []
      redirect_to ending_cart_path
    else
      # 失敗...普通の購入として処理
      session[:cart] = []
      redirect_to root_path, notice: "お買い上げありがとうニャ！普通に平和な一日だったニャ。"
    end
  end

  def ending
    # エンディング画面を表示するだけ
  end

    # 元のページ（商品一覧）に戻る
    redirect_to products_path, notice: "カートに追加したニャ！"
  end
end