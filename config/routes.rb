Rails.application.routes.draw do
  get '/homes' => 'homes#top'
  resources :books
end
  