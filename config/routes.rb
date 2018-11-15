Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'cocktails', to: 'cocktails#index', as: :index
  get 'cocktails/new', to: 'cocktails#new', as: :new
  get 'cocktails/:id', to: 'cocktails#show', as: :show
  post 'cocktails', to: 'cocktails#create'
  post 'doses/new', to: 'doses#create', as: :doses
  delete 'doses/:id', to: 'doses#destroy', as: :deldoses

end
