Rails.application.routes.draw do
  root 'pages#home'
  get '/alt' => 'pages#alt'
  get '/videos' => 'pages#videos'
  get '/music' => 'pages#music'
end
