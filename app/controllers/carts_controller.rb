class CartsController < ApplicationController
  SECRET_PASSWORD = "Railsで世界を救うニャ！"

  def show
    @cart_item_ids = session[:cart] || []
    @cart_products = Product.where(id: @cart_item_ids)
  end

  def add_item
    session[:cart] ||= []
    session[:cart] << params[:product_id]
    redirect_to products_path, notice: "カートに追加したニャ！"
  end

  def checkout
    cart_ids = (session[:cart] || []).map(&:to_i)
    required_ids = Product.sacred.pluck(:id)

    if required_ids.any? && (required_ids - cart_ids).empty? && params[:password] == SECRET_PASSWORD
      session[:cart] = []
      redirect_to ending_cart_path
    else
      session[:cart] = []
      redirect_to root_path, notice: "お買い上げありがとうニャ！世界は今日も平和だニャ。"
    end
  end

  def ending
  end
end
