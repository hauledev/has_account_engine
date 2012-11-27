# encoding: UTF-8

# Routes
Rails.application.routes.draw do
  # Bookings
  resources :bookings do
    collection do
      post :select
      get :simple_edit
    end
    member do
      get :select_booking
      get :copy
    end
  end

  resources :accounts do
    member do
      get :csv_bookings
      get :edit_bookings
      post :update_bookings
    end
    resources :bookings
    resources :attachments
  end

  resources :banks
  resources :bank_accounts do
    member do
      get :csv_bookings
    end
    resources :bookings
    resources :attachments
  end
end