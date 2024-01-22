DatabaseCleaner[:active_record]

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner[:active_record].clean_with(:deletion)
  end

  config.after do |_example|
    DatabaseCleaner.clean
  end
end
