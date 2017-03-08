Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :photos, except: [:new, :edit, :update]
  root 'photos#index'
end
