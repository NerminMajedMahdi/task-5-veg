if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_kC7aiheoJrN4Ep5dXt9vhim4',
    secret_key: 'sk_test_iuaGGFeiqSZeU0CnrZFb07KN'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
