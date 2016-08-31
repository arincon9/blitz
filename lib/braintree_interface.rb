class BraintreeInterface
 require "rubygems"
 require "braintree"

 Braintree::Configuration.environment = :sandbox
 Braintree::Configuration.merchant_id = ENV["braintree_merchant_id"]
 Braintree::Configuration.public_key = ENV["braintree_public_key"]
 Braintree::Configuration.private_key = ENV["braintree_private_key"]

 def self.make_payment(amount)
  result = Braintree::Transaction.sale(
  amount: amount,
  payment_method_nonce: nonce_from_the_client,
  options: {
   sumbit_for_settlement: true
  }
  )

  if result.success?
   puts "success!: #{result.transaction.id}"
  elsif result.transaction
   puts "Error processing transaction:"
   puts "code: #{result.transaction.processor_response_code}"
   puts "text: #{result.transaction.processor_response_text}"
  else
   p result.errors
  end
 end
end
