class ChargesController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_order, :require_same_id

  def new
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
      amount: @amount,
      description: 'Market customer',
      currency: 'aud'
    )

    # place more code upon successfully creating the charge
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
    flash[:notice] = "Please try again"
  end

end
