class BidsController < ApplicationController

  def create
    @bid = current_user.bids.build(bid_params)
    @product = Product.find(@bid.product_id)

    if product_myself?
      render_error_messages("自分の商品に入札はできません。")
    elsif @bid.current_bid.blank?
      render_error_messages("入札内容が適切ではありません")
    elsif !@bid.greater_price?
      render_error_messages("入札金額が低いため入札できませんでした。")
    else

      Bid.transaction do
        @bid.save!
        @product.update_price(@bid.current_bid)
        @product.save!
      end
      flash[:success] = "入札に成功しました。"
      redirect_to product_path(@bid.product_id)
    end
    rescue ActiveRecord::RecordInvalid
      render_error_messages("入力された金額が大きすぎます。")
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
