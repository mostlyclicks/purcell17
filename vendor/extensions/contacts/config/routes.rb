Refinery::Core::Engine.routes.draw do
  # Frontend routes
  namespace :contacts do

    resources :contacts, :path => '', :only => [:index, :new, :create] do
      collection do
        get :thank_you
      end
    end
  end

  # Admin routes
  namespace :contacts, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}" do
      resources :contacts do 
  end

      scope :path => 'contacts' do
        resources :settings, :only => [:edit, :update]
      end
    end
  end
end

