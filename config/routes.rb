Rails.application.routes.draw do
  root 'pages#home'

  get 'about-me', to: 'pages#about'
  get 'contact-me', to: 'pages#contact'

  resources :portfolios

  resources :blogs
end
