class ShopsController < ApplicationController
  before_action :authenticate_user!
  # Method to load resource to authorize actions


  def index
    @users = User.all
  end

  def show
    @items = Item.all
  end

end
