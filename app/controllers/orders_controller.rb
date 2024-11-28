class OrdersController < ApplicationController
  before_action :set_cart, only: [:create]
  before_action :set_order, except: [:create, :index]

  def index
    @orders = Current.session.user.orders
  end

  def show
    # @order = Current.session.user.orders.find(params[:id])
    @order = Order.find(params[:id])
  end

  # Créer une commande à partir du panier
  def create
    @order = Current.session.user.orders.build(total_price: @cart.total_price, status: 'pending')  # Statut initial 'pending'
    
    # Créer les OrderItems à partir des éléments du panier
    @cart.cart_items.each do |cart_item|
      # @order.order_items.build(item: cart_item.item, quantity: cart_item.quantity, price: cart_item.item.price)
      @order.order_items.build(
        item: cart_item.item, 
        # quantity: cart_item.quantity,
        price: cart_item.item.price)
    end

    if @order.save
      @cart.cart_items.destroy_all # Vider le panier après la création de la commande
      redirect_to order_path(@order), notice: 'Commande créée avec succès.'
    else
      redirect_to cart_path, alert: 'Erreur lors de la création de la commande.'
    end
  end

  private

  def set_cart
    @cart = Current.session.user.cart || Cart.create(user: Current.session.user)
  end

  def set_order
    @order = Current.session.user.orders.find_by(id: params[:id]) || Current.session.user.orders.create(status: 'pending')
  end

  # def set_order
  #   @order = current_user.orders.find_by(id: params[:id]) || current_user.orders.create(status: 'pending') 
  #   # Si pas de commande, une nouvelle commande "pending" est créée
  # end

end