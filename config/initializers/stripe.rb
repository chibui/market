Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_TEST_PUB'],
  :secret_key      => ENV['STRIPE_TEST_SECRET']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
