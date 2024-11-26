class CheckoutController < ApplicationController
  def create
    @total = params[:total].to_d
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'eur',
            unit_amount: (@total*100).to_i,
            product_data: {
              name: 'Rails Stripe Checkout',
            },
            unit_amount: @total,
          },
          quantity: 1,
        }
      ],
      mode: 'payment',
      # metadata: {},
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    redirect_to @session.url, allow_other_host: true
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    # @event_id = @session.metadata.event_id

    # Attendance.create(user: current_user, event_id: @event.id, stripe_customer_id: @session.customer )
    # redirect_to event_path(@event_id), notice: "Paiement réussi ! Vous êtes inscrit à l'événement."
  end

  def cancel
    # Optional
  end
end
