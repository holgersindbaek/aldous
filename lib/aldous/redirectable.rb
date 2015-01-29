module Aldous
  module Redirectable
    include Respondable

    def action(controller)
      ::Aldous::ResponseAction::Redirect.new(location, controller, result, status)
    end

    def location
      raise RuntimeError.new("Redirectable objects must define a 'location' method")
    end

    def status
      :found
    end
  end
end
