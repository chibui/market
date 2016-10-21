class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index

    # @items = Item.order(:name)
    if params[:search]
      @items = Item.search(params[:search]).order("created_at DESC")
    else
      @items = Item.all.order('created_at DESC')
    end

  end


  private

end
