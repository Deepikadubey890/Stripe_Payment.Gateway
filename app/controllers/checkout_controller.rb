class CheckoutController < ApplicationController
	def new
		
	end
	def create
		# product = Post.find(params[:id])
		debugger
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
     # These placeholder URLs will be replaced in a following step.
     success_url: 'https://example.com/success',
     cancel_url: 'https://example.com/cancel',
 })
	end
end	