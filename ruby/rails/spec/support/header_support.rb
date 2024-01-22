require 'rspec/core/shared_context'

module HeadersSupport
  extend RSpec::Core::SharedContext
  let(:headers) do
    {
      CONTENT_TYPE: 'application/json',
      HTTP_ACCEPT: 'application/json'
    }
  end
end

RSpec.configure do |config|
  config.include HeadersSupport, type: :request
end
