Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "sevens#index"
  resources :sevens, only: [:index, :new, :create, :show] do
    collection do
      get :judgment
      get :ninety
      get :sixty
      get :thirty
      get :ten
      get :calc
    end
  end
end
