Rails.application.routes.draw do
  root 'calendars#list'
  get '/calendar', to: 'calendar#calendar'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
