require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'

require_relative '../config/environment'

# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'

# Home-made support / helper for this test suite
Rails.root.glob('spec/support/**/*.rb').each { require_relative _1 }
Rails.root.glob('spec/helpers/**/*.rb').each { require_relative _1 }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

RSpec.configure do |config|
  config.before(:suite) do
    require 'csv'
    CSV.foreach('../../data.csv', headers: true).map(&:to_h).each do |row|
      FactoryBot.create(:driver, row)
    end
  end
end
