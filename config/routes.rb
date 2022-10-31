Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :updates, only: [:index, :show, :create, :new]

  resources :tags, only: [:index]
  root to: "updates#index"
  get 'tags/:tag', to: 'updates#index', as: :tag
end
