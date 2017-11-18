Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]

  # root to: "home#show"
  get '/redirect', to: 'home#redirect', as: 'redirect'
  get '/callback', to: 'home#callback', as: 'callback'
  get '/calendars', to: 'home#calendars', as: 'calendars'
  get '/events/:calendar_id', to: 'home#events', as: 'events', calendar_id: /[^\/]+/

end
