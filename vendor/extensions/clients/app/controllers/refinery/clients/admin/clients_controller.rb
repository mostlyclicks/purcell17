module Refinery
  module Clients
    module Admin
      class ClientsController < ::Refinery::AdminController

        crudify :'refinery/clients/client',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def client_params
          params.require(:client).permit(:name, :company, :job_title, :city, :state, :body, :photo_id)
        end
      end
    end
  end
end
