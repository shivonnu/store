class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
# new と create アクションの前に check_development_env を実行
  before_action :check_development_env, only: [:new, :create, :edit, :update] # 👈 追
  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_path, notice: "Product was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def check_development_env
    # 環境が 'development' でない場合
    unless Rails.env.development?
      # ユーザーを商品一覧ページにリダイレクトし、エラーメッセージを表示
      redirect_to products_path, alert: "この機能は開発環境でのみご利用いただけます。"
    end
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
  def product_params
    # :name, :description, :price に加えて :image_url を許可します
    params.require(:product).permit(:name, :description, :price, :image_url)
  end
end
