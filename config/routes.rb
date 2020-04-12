Rails.application.routes.draw do
  get 'registers/index'

  root "registers#index"
end
