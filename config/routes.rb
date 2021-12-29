# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resources :columns, except: %i[index show]
  end
  root 'categories#index'
  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end
end
