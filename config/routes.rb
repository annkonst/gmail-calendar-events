Rails.application.routes.draw do
  get '/redirect', to: 'home#redirect', as: 'redirect'
  get '/callback', to: 'home#callback', as: 'callback'
  get '/calendars', to: 'home#calendars', as: 'calendars'
  get '/events/:calendar_id', to: 'home#events', as: 'events', calendar_id: /[^\/]+/

end
