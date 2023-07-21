# frozen_string_literal: true

Rails.application.routes.draw do
  resources :contacts

  root to: 'contacts#index'

  # get 'contacts/index'
  # get 'contacts/show', to: 'contacts#show'
  get 'contacts/new', to: 'contacts#new'
  get 'contacts/delete', to: 'contacts#delete'
end
