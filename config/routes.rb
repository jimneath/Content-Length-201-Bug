ContentLength::Application.routes.draw do
  resources :apples
  root :to => 'apples#index'
end