Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      registrations: "users/registrations",
      sessions: "users/sessions"
    }
  root 'products#index'
  resources :products, only: [:index, :new, :create, :show] do
  end
end
