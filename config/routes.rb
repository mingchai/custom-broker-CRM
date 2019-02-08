Rails.application.routes.draw do
  get("/", to: "welcome#home", as: :root)
  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :clients do
    resources :policies #do
      # resources :coverages, except: [:show]
    # end
  end
  
  namespace :api do
    namespace :v1 do
      resource :session, only: [:create, :destroy]
      resources :clients
      resources :users, only:[] do
        get :current, on: :collection
      end
    end
  end
end
