ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
#Use Minitest::Reporters for make TestCase look more better
require "minitest/reporters"
Minitest::Reporters.use!
class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  #define method to return true if a test user is logged in.
  def is_signed_in?
  	#return if session nil or not
  	!session[:user_id].nil?
  end
end
