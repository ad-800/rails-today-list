Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :updates, only: [:index, :show, :create, :new]

  root to: "updates#index"
end
