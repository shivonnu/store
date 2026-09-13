require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cart_url
    assert_response :success
  end

  test "adds a product to the cart" do
    post add_item_cart_url(product_id: products(:one).id)
    assert_redirected_to products_url
    follow_redirect!
    assert_match "カートに追加したニャ", response.body
  end

  test "normal checkout thanks the customer" do
    post add_item_cart_url(product_id: products(:one).id)
    post checkout_cart_url, params: { password: "wrong" }
    assert_redirected_to root_url
    follow_redirect!
    assert_match "お買い上げありがとうニャ", response.body
  end

  test "sacred relics and password unlock the ending" do
    [ products(:two), products(:string_of_space), products(:cardboard_castle) ].each do |product|
      post add_item_cart_url(product_id: product.id)
    end

    post checkout_cart_url, params: { password: CartsController::SECRET_PASSWORD }
    assert_redirected_to ending_cart_url
    follow_redirect!
    assert_match "MISSION COMPLETE", response.body
  end
end
