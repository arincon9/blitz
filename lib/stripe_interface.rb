require "stripe"
Stripe.api_key = #key...

#list charges
Stripe::Charge.list()
