ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'
require 'shoulda/matchers'
require 'factory_girl'
require 'capybara/rspec'
require 'simplecov'

Capybara.javascript_driver = :poltergeist

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include JsonSpec::Helpers
  config.include FactoryGirl::Syntax::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  Kernel.srand config.seed

  config.use_transactional_fixtures = false
  config.use_transactional_examples = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :active_record
    with.library :active_model
    with.library :action_controller

    with.library :rails
  end
end

RSpec::Matchers.define :have_abilities do |*actions|
  include HaveAbilitiesMixin
  chain :on do |obj|
    @obj = obj
  end

  match do |ability|
    verify_ability_type(ability)
    @expected_hash = build_expected_hash(actions, default_expectation: true)
    @actual_hash = {}
    @expected_hash.each do |action, _|
      @actual_hash[action] = ability.can?(action, @obj)
    end
    @actual_hash == @expected_hash
  end

  description do
    obj_name = @obj.class.name
    obj_name = @obj.to_s.capitalize if [Class, Module, Symbol].include?(@obj.class)
    "have abilities #{@expected_hash.keys.join(', ')} on #{obj_name}"
  end

  failure_message do
    obj_name = @obj.class.name
    obj_name = @obj.to_s.capitalize if [Class, Module, Symbol].include?(@obj.class)
    "expected user to have abilities: #{@expected_hash} for #{obj_name}, but got #{@actual_hash}"
  end
end

RSpec::Matchers.define :not_have_abilities do |*actions|
  include HaveAbilitiesMixin
  chain :on do |obj|
    @obj = obj
  end

  match do |ability|
    verify_ability_type(ability)
    if actions.is_a?(Hash)
      raise ArgumentError, 'You cannot pass a hash to not_have_abilities. Use have_abilities instead'
    end
    @expected_hash = build_expected_hash(actions, default_expectation: false)
    @actual_hash = {}
    @expected_hash.each do |action, _|
      @actual_hash[action] = ability.can?(action, @obj)
    end
    @actual_hash == @expected_hash
  end

  description do
    obj_name = @obj.class.name
    obj_name = @obj.to_s.capitalize if [Class, Module, Symbol].include?(@obj.class)
    "not have abilities #{@expected_hash.keys.join(', ')} on #{obj_name}" if @expected_hash.present?
  end

  failure_message do
    obj_name = @obj.class.name
    obj_name = @obj.to_s.capitalize if [Class, Module, Symbol].include?(@obj.class)
    "expected user NOT to have abilities #{@expected_hash.keys.join(', ')} for #{obj_name}, but got #{@actual_hash}"
  end
end

module HaveAbilitiesMixin
  def build_expected_hash(actions, default_expectation:)
    return actions if actions.is_a?(Hash)
    expected_hash = {}
    if actions.is_a?(Array)
      # If given an array like [:create, read] build a hash like:
      # {create: default_expectation, read: default_expectation}
      actions.each { |action| expected_hash[action] = default_expectation }
    elsif actions.is_a?(Symbol)
      # Build a hash if it's just a symbol.
      expected_hash = { actions => default_expectation }
    end
    expected_hash
  end

  def verify_ability_type(ability)
    return if ability.class.ancestors.include?(CanCan::Ability)
    raise TypeError, "subject must mixin CanCan::Ability, got a #{ability.class.name} class."
  end
end
