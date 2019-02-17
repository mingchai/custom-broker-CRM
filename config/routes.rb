Rails.application.routes.draw do
  get("/", to: "welcome#home", as: :root)
  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :clients do
    post("/call", to: "clients#call")
    resources :policies #do
      # resources :coverages, except: [:show]
    # end
  end

  resources :tokens, only: [:create]
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resource :session, only: [:create, :destroy]
      resources :clients
      resources :users, only:[] do
        get :current, on: :collection
      end
      resources :users
    end
  end
end
