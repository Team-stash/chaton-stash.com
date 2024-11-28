class CartsController < ApplicationController
  before_action :set_cart

  def show
    @cart_items = @cart.cart_items.includes(:item)
    @total_price = @cart.total_price
    # @total_price = @cart_items.sum { |ci| ci.item.price }
    # @total_price = @cart_items.sum { |ci| ci.item.price * (ci.quantity }
  end

  def update
    cart_item = @cart.cart_items.find_by(id: params[:cart_item_id])

    if cart_item&.destroy # &. safe navigation operator si cart_item est nill alors il retourne nil
      redirect_to cart_path, notice: 'Item retiré du panier.'
    else
      redirect_to cart_path, alert: 'Erreur lors de la mise à jour du panier.'
    end
  end

  def destroy
    @cart.cart_items.destroy_all
    redirect_to cart_path, notice: 'Panier vidé.' # redirect à modifier quand panier transféré à commande
  end


  def add_item
    item = Item.find(params[:item_id])

    # Vérifie si l'item est déjà dans le panier
    cart_item = @cart.cart_items.find_by(item: item)

    if cart_item
      flash[:notice] = 'Cet item est déjà dans votre panier.'
      # version avec quantité
      # #Si l'item est déjà dans le panier, incrémente la quantité
      # cart_item.increment!(:quantity)
      # flash[:notice] = 'Quantité de l\'item augmentée dans le panier.'
    else
      @cart.cart_items.create(item: item)
      flash[:notice] = 'Item ajouté au panier avec succès.'
    end

    redirect_to items_path
  end


  private

  def set_cart
    @cart = Current.session.user.cart || Cart.create(user: Current.session.user)
  end
end