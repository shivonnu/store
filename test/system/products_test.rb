require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index shows product images" do
    visit products_url
    assert_selector "h1", text: "地球救済ミッション発動中"
    assert_selector "img[alt='#{@product.name}']"
  end

  test "should create product" do
    visit products_url
    click_on "商品を追加"

    fill_in "商品名", with: "新しいまたたび"
    fill_in "説明", with: @product.description
    fill_in "価格", with: @product.price
    fill_in "画像ファイル名 (例: cat_food.jpg)", with: @product.image_url
    click_on "保存する"

    assert_text "商品を登録したニャ"
    click_on "商品一覧へ"
  end

  test "should update Product" do
    visit product_url(@product)
    click_on "編集", match: :first

    fill_in "説明", with: "さらにパワーアップしたニャ"
    click_on "保存する"

    assert_text "商品を更新したニャ"
  end

  test "should destroy Product" do
    visit product_url(@product)
    accept_confirm { click_on "削除", match: :first }

    assert_text "商品を削除したニャ"
  end
end
