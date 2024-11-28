class CheckoutController < ApplicationController
  def create
    @total = (params[:total].to_d * 100).to_i # Convertir en centimes

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'eur',
            unit_amount: @total, # Montant en centimes
            product_data: {
              name: 'Rails Stripe Checkout',
            },
          },
          quantity: 1,
        }
      ],
      mode: 'payment',
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    redirect_to session.url, allow_other_host: true
  end

  def success
  @session = Stripe::Checkout::Session.retrieve(params[:session_id])
  @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

  # Récupérer l'Order à partir des métadonnées Stripe
  order_id = @session.metadata.order_id
  @order = Order.find(order_id)

  # Mettre à jour le statut de la commande
  if @payment_intent.status == 'succeeded'
    @current.session.order.update(status: 'paid')
    redirect_to orders_path, notice: 'Paiement réussi et commande mise à jour.'
  else
    redirect_to orders_path, alert: 'Paiement non réussi, commande non mise à jour.'
  end
end

  def cancel
    # Logique à ajouter en cas d'annulation
  end
end
