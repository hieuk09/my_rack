module MyRack
  class Handlers
    @handlers = {}

    def self.register(server_name, handler)
      @handlers[server_name.to_sym] = handler
    end

    def self.get(server_name)
      @handlers[server_name.to_sym]
    end
  end
end
