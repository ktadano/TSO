module ProductsHelper

  def product_myself?
    current_user.id == @product.user_id
  end
end
