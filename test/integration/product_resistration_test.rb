require 'test_helper'

class ProductResistrationTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "invalid product resistration" do
    post login_path, session: { name: @user.name,
                                password: "password" }
    get product_resistration_path
    assert_no_difference 'Product.count' do
      post products_path,
        product: {
          name: "",
          current_bid: "",
          time_left: "",
          discription: "invalid"
        }
    end
    assert_template 'products/new'
  end
end
