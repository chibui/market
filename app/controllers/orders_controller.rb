class OrdersController < ApplicationController
  include CurrentCart
  before_action :authenticate_user!
  before_action :set_cart, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

respond_to :js

  # def paid
  #   @order = Order.find(params[:id])
  #   if @order.update(paid: true)
  #     redirect_to orders_path
  #   else
  #     render @order
  #   end
  # end
  #

  # toggle shipped status
  def shipped
    @order = Order.find(params[:id])
    if @order.update(shipped: true)
      redirect_to orders_path
    else
      render @order
    end
  end

  # toggle received status
  def received
    @order = Order.find(params[:id])
    if @order.update(received: true)
      redirect_to orders_path
    else
      render @order
    end
  end

  # GET /orders
  # GET /orders.json
  def order_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :role_id, :contact, :phone, :address, :abn, :bio)
  end

  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    if @cart.line_items.empty?
      redirect_to store_index_url, notice: "Your cart is empty"
      return
    end

    @order = Order.new
  end

  # GET /orders/1/edit
  def edit

  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
    @order.user_id = current_user.id if current_user

    respond_to do |format|
      if @order.save
        Cart.destroy( session[ :cart_id ] )
        format.html { redirect_to new_charge_path(order:@order), notice:
        session[:cart_id] = nil
          'Thank you for your order.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:received, :shipped, :user_id, :paid)

    end


  end
