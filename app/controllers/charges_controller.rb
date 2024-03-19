class ChargesController < ApplicationController
 
  def new
  end

  def create
    #create stripe customer for payment, update if already created
    customer = Stripe::Customer.create(
    email: params[:stripeEmail],
    source: params[:stripeToken]
  )
  
    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
     line_items: [{
       price_data: {
         currency: 'usd',
         product_data: {
           name: 'T-shirt',
         },
         unit_amount: 2000,
       },
       quantity: 1,
     }],
      mode: 'payment',
      success_url: 'https://example.com/success',
      cancel_url: 'https://example.com/cancel'
    })
    # redirect_to @session.url
    
    # a = @session.url
  session_url = session.url 
  redirect_to session_url, allow_other_host: true
  # render js: "window.location.href = '#{session_url}';"
end
  
  # def checkout(url)
  #   debugger
  #   redirect_to 
  # end
  
  # def success
  #   #handle successful payments
  #   redirect_to root_url, notice: "Purchase Successful"
  # end
  
  # def cancel
  #   #handle if the payment is cancelled
  #   redirect_to root_url, notice: "Purchase Unsuccessful"
  # end



# def create
#   amount = 500 # Set your amount here

#   customer = Stripe::Customer.create(
#     email: params[:stripeEmail],
#     source: params[:stripeToken]
#   )
#   Stripe::Checkout::Session.create({
#       payment_method_types: ['card'],
#     line_items: [{
#        price_data: {
#          currency: 'usd',
#          product_data: {
#            name: 'T-shirt',
#          },
#          unit_amount: 2000,
#        },
#        quantity: 1,
#      }],

#      mode: 'payment',
#      # These placeholder URLs will be replaced in a following step.
#      success_url: 'https://example.com/success',
#      cancel_url: 'https://example.com/cancel',
#  })

#   # payment_intent.attach({ payment_method: 'pm_card_visa' })

#   # payment_intent.confirm

#   render json: { client_secret: payment_intent.client_secret }
#   rescue Stripe::CardError => e
#     flash[:error] = e.message
#     redirect_to root_path
#   rescue Stripe::InvalidRequestError => e
#     flash[:error] = e.message
#     redirect_to root_path
# end


# def create
#   @amount = 500

#   customer = Stripe::Customer.create(
#     email: params[:stripeEmail],
#     source: params[:stripeToken]
#   )

#   charge = Stripe::Payment.create(
#     customer: customer.id,
#     amount: @amount,
#     description: 'Rails Stripe customer',
#     currency: 'usd'
#   )

# rescue Stripe::CardError => e
#   flash[:error] = e.message
#   redirect_to new_charge_path
# end

 # def create
  
 #    amount = 500 
 #      payment_intent = Stripe::PaymentIntent.create({
 #      amount: amount,
 #      currency: 'inr',
 #      payment_method_types: ['card'],
 #      description: 'Rails Stripe customer',
 #      receipt_email: params[:stripeEmail],
      

 #    })

 #    # Return the client secret to the front-end
 #    render json: { client_secret: payment_intent.client_secret }
 #    rescue Stripe::CardError => e
 #    flash[:error] = e.message
 #    redirect_to root_path
 #  end


end
