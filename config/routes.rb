# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories do
    resources :columns, except: %i[index show]
  end
  root 'categories#index'
end
