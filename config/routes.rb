FormObjsEdit::Application.routes.draw do

  root "propuests#index"

  resources :d_items
  resources :propuests
  resources :items
  resources :categories
  resources :clientes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
