$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pry'
require 'vcr_setup'
require 'exchange'

Exchange.stripe_api_key = ENV.fetch('STRIPE_SECRET_KEY')
