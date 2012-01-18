Listt::Application.routes.draw do
  devise_for :users

  resources :list_items

  resources :lists

  root :to => "lists#index"

end
