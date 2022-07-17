require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"
require "minitest"
require 'minitest/rails'
require 'minitest/reporters'
require 'contexts'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  # parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  include Contexts


  # Add more helper methods to be used by all tests here...

  def deny(condition, msg="")
    # a simple transformation to increase readability IMO
    assert !condition, msg
  end

  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]
end
