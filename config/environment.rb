# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!
ENV['STRIPE_PUBLISHABLE_KEY'] = 'pk_test_51OtPoWSFyu3TMCPfsjvJu4izNAvoS7KhcK5SmA1AIldiAnQRKI9UjgTZOukUG1mNQQzK8jSdNhrWkdKXKzYlYdPg006xGEBld1'

ENV['STRIPE_SECRET_KEY'] = 'sk_test_51OtPoWSFyu3TMCPfft7eGfSeZHuRv7Q484QqrEEL10tZRc0cTn3tf3TjHNnz58TYBlTvTPmmtxGHgrEVRPDpoB1T00fNjT18uM'
