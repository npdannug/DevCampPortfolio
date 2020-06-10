Rails.application.routes.draw do
  resources :portfolios
  root 'pages#home'
  get 'pages/about'
  get 'pages/contact'
  resources :blogs

end
