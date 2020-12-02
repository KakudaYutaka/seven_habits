Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "sevens#index"
  resources :sevens, only: :index do
    collection do
      get :judgment
      get :ninety
      get :sixty
      get :thirty
      get :ten
    end
  end
end
