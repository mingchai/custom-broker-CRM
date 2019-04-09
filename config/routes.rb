Rails.application.routes.draw do
  get("/", to: "welcome#home", as: :root)
  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :clients do
    post("/call", to: "clients#call")
    resources :policies #do
      # resources :coverages, except: [:show]
     #end
  end

  resources :policies, only: [] do
    resources :payments, only: [:new, :create]
   end

  resources :tokens, only: [:create]
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      
      resource :session, only: [:create, :destroy]

      resources :clients do
        post("/call", to: "clients#call")
      end

      resources :users, only:[] do
        get :current, on: :collection
      end

      resources :users

      resources :policies, only: [] do
        resources :payments, only: [:new, :create]
       end
    
      resources :tokens, only: [:create]
    end
  end
end
