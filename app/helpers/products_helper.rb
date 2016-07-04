module ProductsHelper

  def myself?
    current_user.id == @product.user_id
  end
end
