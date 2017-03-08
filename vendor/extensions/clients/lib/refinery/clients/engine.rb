module Refinery
  module Clients
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Clients

      engine_name :refinery_clients

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "clients"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.clients_admin_clients_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Clients)
      end
    end
  end
end
