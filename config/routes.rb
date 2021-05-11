Rails.application.routes.draw do
  root 'calendar#list'
  get '/calendar', to: 'calendar#calendar', as: 'calendar'
  post '/lightning', to: 'calendar#lightning_talks', as: 'lightning_talks'
  resources :presentations do
    resources :presentation_entries 
  end
  get '/presentation/:id/random', to: 'presentations#random', as: 'random'
end