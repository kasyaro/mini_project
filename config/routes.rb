Rails.application.routes.draw do
  root 'welcome#index'
  resources :coffees, only: [:index, :show, :update ] do
  resources :reviews, exclude: [:update]
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
