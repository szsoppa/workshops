Rails.application.routes.draw do
  resources :lists

  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  devise_for :users,
             :controllers => { :registrations => "my_devise/registrations"}
  resources :users, :only => [:show]

  root 'categories#index'
end
