class BidsController < ApplicationController

  def create
    @bid = current_user.bids.build(bid_params)
    @product = Product.find(@bid.product_id)

    if @bid.current_bid.blank?
      render_error_messages("入札内容が適切ではありません")
    elsif !@bid.greater_price?
      render_error_messages("入札金額が低いため入札できませんでした。")
    else
      flash[:success] = "入札に成功しました。"
      redirect_to product_path(@bid.product_id)
    end

  private

  def bid_params
    params.require(:bid).permit(:product_id, :current_bid)
  end

  def render_error_messages(message)
    flash.now[:danger] = message
    render 'products/show'
  end
end
