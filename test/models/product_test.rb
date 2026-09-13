require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "sacred scope finds starred relics" do
    assert_includes Product.sacred, products(:two)
    assert_not_includes Product.sacred, products(:one)
  end

  test "image_available? is true when the asset file exists" do
    assert products(:one).image_available?
  end
end
