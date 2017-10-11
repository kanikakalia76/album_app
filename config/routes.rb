 Rails.application.routes.draw do

  root 'home#index'

  #resources :users do
    resources :myalbums do 
  	resources :pictures
  	end 
  #end
#added tag code

get 'tags/:tag', to: 'pictures#index', as: :tag

  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
