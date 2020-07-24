Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#index"
  resources :users do
    collection do
      get 'sign_up'
      get 'set_up_password'
    end
    member do
    end
  end
end
