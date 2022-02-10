# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: %i[registrations password]

  resources :categories do
    resources :items, expect: %i[show], module: :categories
  end

  resource :dashboards, only: %i[show]

  namespace :admin do
    resources :categories do
      resources :columns, except: %i[index show], module: :categories
    end
  end

  root 'dashboards#show'
end
