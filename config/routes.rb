Rails.application.routes.draw do
  get 'thoughts' => 'thoughts#index'
  get 'thoughts/:id' => 'thoughts#show'
  post 'thoughts' => 'thoughts#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
