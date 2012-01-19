Listt::Application.routes.draw do
  match "/auth/:provider/callback" => "authentications#create"

  devise_for :users

  resources :authentications

  resources :list_items

  resources :lists

  root :to => "lists#index"

end
