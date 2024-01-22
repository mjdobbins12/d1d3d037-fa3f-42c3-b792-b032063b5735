Rails.application.routes.draw do
  post '/reminder/:id', to: 'notifications#reminder'
end
