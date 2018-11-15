Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'cocktails', to: 'cocktails#index', as: :index
  get 'cocktails/new', to: 'cocktails#new', as: :new
  get 'cocktails/:id', to: 'cocktails#show', as: :show
  post 'cocktails', to: 'cocktails#create', as: :cocktail
  post 'doses/new', to: 'doses#create', as: :doses
  get 'cocktails/:cocktail_id/doses/new', to: 'doses#new'
  delete 'doses/:id', to: 'doses#destroy', as: :deldoses
  post '/index', to: 'cocktails#index'
  get 'cocktails/:id/doses/new', to: 'doses#new', as: :doses_new
  get 'doses/:id', to: 'doses#show', as: :doses_show
  post 'cocktails/:cocktail_id/doses', to: 'doses#create'

end
