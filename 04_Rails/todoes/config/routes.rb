Rails.application.routes.draw do
  root to: 'todoes#index'
  resources :todoes
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
