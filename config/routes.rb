Rails.application.routes.draw do
  root 'performances#index'
  resources :performances
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
