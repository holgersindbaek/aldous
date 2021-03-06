require 'aldous/service/wrapper'
require 'aldous/errors/user_error'

module Aldous
  class Service
    include Aldous

    class << self
      def build(*args)
        Aldous::Service::Wrapper.new(new(*args))
      end

      def perform(*args)
        build(*args).perform
      end

      def perform!(*args)
        build(*args).perform!
      end
    end

    def perform
      raise NotImplementedError.new("#{self.class.name} must implement method #perform")
    end

    def raisable_error
      Aldous::Errors::UserError
    end

    def default_result_data
      {}
    end
  end
end
