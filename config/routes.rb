Listt::Application.routes.draw do
  match "/auth/:provider/callback" => "authentications#create"

  get "/about"    => "static#about"
  get "/policies" => "static#policies"
  get "/contact"  => "static#contact"
  get "/help"     => "static#help"

  devise_for :users, :controllers => {:registrations => "registrations"} do
    get "/users/sign_up" => "authentications#index"
    get "/users/sign_in" => "authentications#index"
  end

  resources :authentications

  resources :list_items

  resources :lists

  root :to => "lists#index"
end
