Rails.application.routes.draw do
  root 'calendar#list'
  get '/calendar', to: 'calendar#calendar', as: 'calendar'
  post '/lightning', to: 'calendar#lightning_talks', as: 'lightning_talks'
end
