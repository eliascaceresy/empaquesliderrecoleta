Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :tomaturnos
  resources :turns do
    collection {post :import}
  end

  devise_for :users, controllers:{registrations: "registrations"}
  resources :groups
  resources :users, only: [:index,:show] do
    collection {post :import}
  end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
 devise_scope :user do
  authenticated :user do
    root 'welcome#index'
  end


  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
  end
 


  put "/groups/:id/activate", to: "groups#activate"
  put "/groups/:id/inactivate", to: "groups#inactivate"

  put "/turns/:id/tomarturno", to: "turns#tomarturno"
  put "/turns/:id/liberarturno", to: "turns#liberarturno"

   put "/users/:id/activar", to: "users#activar"
  put "/users/:id/desactivar", to: "users#desactivar"

   put "/tomaturnos/:id/activartoma", to: "tomaturnos#activartoma"
  put "/tomaturnos/:id/desactivartoma", to: "tomaturnos#desactivartoma"

delete "/turn/borrarturnos", to: "turns#borrarturnos"


  get "/MisTurnos", to: "welcome#dashboard"
  get "/TurnosTomados", to: "welcome#dashboard2"
  get "/AgregarTurnos", to: "welcome#dashboard3"
  get "/Perfil/:id", to: "welcome#dashboard4"
  get "/TomaDeTurnos", to: "welcome#dashboard5"

end
