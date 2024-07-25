require 'puma'
require 'rack/handler/puma'

module MyRack
  class Handlers
    class Puma
      extend ::Puma::RackHandler
    end

    register :puma, Puma
  end
end
