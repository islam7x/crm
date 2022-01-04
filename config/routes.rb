# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resources :items, expect: %i[show]
  end

  namespace :admin do
    resources :categories do
      resources :columns, except: %i[index show], module: :categories
    end

  end
  root 'admin/categories#index'
end
