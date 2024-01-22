module ResponseHelper
  def response_body
    response.parsed_body
  end
end

module ActionDispatch
  class TestResponse
    def parsed_body
      @parsed_body ||= body.presence && JSON.parse(body, symbolize_names: true)
    end
  end
end

RSpec::Core::ExampleGroup.include ResponseHelper
