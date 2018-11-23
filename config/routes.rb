Rails.application.routes.draw do

  get 'home/landing'
	root "home#landing"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
