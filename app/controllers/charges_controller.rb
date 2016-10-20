class ChargesController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_order, only: [:show, :edit, :update, :destroy]


  # def order_params
  #   params.require(:user).permit(:email, :password, :password_confirmation, :name, :role_id, :contact, :phone, :address, :abn, :bio)
  # end

  def new
    @order = Order.find(params[:order])
    # this will remain empty unless you need to set some instance variables to pass on
  end

  def create
    # Amount in cents
    @amount = params[:stripeAmount]

    # Create the customer in Stripe
    customer = Stripe::Customer.create(
      # pass current_user.email
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    # Create the charge using the customer data returned by Stripe API
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount.to_i * 100,
      description: 'Market customer',
      currency: 'aud'
    )

    # if charge["paid"] == true
    #   @order.toggle(:paid)
    # end

    flash[:success] = 'Your payment has been processed'
    redirect_to root_path

    # place more code upon successfully creating the charge
  rescue Stripe::CardError => e
    flash[:error] = e.message

    redirect_to charges_path
    flash[:notice] = "Please try again"
  end

  private

  # def set_order
  #   @order = Order.find(params[:id])
  # end


end
