Rails.application.routes.draw do
  root 'pages#home', except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact-me', to: 'pages#contact'

  resources :portfolios

  resources :blogs
end
