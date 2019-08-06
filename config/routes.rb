Rails.application.routes.draw do
  resources :element_upgrades, except: :destroy
  resources :resource_loadout_combos
  resources :weapon_offense_type_combos
  resources :modifiers
  resources :shapes
  resources :elements
  resources :armor_types
  resources :weapons
  resources :offense_types
  resources :resources
  resources :stats
  resources :races
  resources :char_configs, except: [:create, :new, :destroy]

  get 'home/index'
  get 'home/generate'

  root 'home#index'
end
