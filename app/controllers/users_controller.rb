class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @products = @user.products.paginate(page: params[:page])
    @bid_items = my_bid_list
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def my_bid_list
    bid_ids = Bid.where("user_id = ?", @user).
      select(:product_id).
      uniq
    return Product.where(id: bid_ids.pluck(:product_id))
  end
end
