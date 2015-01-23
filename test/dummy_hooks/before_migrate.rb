rake "spree:install:migrations"

insert_into_file File.join('config', 'routes.rb'), :after => "Rails.application.routes.draw do\n" do
  "  # Mount Spree's routes\n  mount Spree::Core::Engine, :at => '/'\n"
end

# Copy spree user initializer
template "initializers/spree_user.rb", "config/initializers/spree_user.rb"

run "rails g spree_variant_options:install"
