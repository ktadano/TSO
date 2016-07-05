class HomeController < ApplicationController

  def index
    if logged_in?
      @product_list = current_user.product_item.paginate(page: params[:page])
    end
  end
end
