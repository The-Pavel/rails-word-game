Rails.application.routes.draw do

  get 'new', to: 'games#new', as: 'new'
  post 'score', to: 'games#score', as: 'score'

  # post 'word', to: 'https://wagon-dictionary.herokuapp.com/:answer', as: 'dictionary'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
