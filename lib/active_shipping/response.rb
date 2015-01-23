module ActiveShipping #:nodoc:
  class Response
    attr_reader :params
    attr_reader :message
    attr_reader :test
    attr_reader :xml
    attr_reader :request

    def initialize(success, message, params = {}, options = {})
      @success, @message, @params = success, message, params.stringify_keys
      @test = options[:test] || false
      @xml = options[:xml]
      @request = options[:request]
      raise ResponseError.new(self) unless success
    end

    def success?
      @success ? true : false
    end

    def test?
      @test ? true : false
    end
  end
end
