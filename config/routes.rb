# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :categories do
      resources :columns, except: %i[index show]
    end
  end
  root 'admin/categories#index'
end
