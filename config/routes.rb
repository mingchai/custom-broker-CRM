Rails.application.routes.draw do
  get("/", to: "welcome#home", as: :root)
  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :clients, shallow: true do
    resources :policies #do
      # resources :coverages, except: [:show]
    # end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
