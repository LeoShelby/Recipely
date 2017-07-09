# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

#fix NameError: uninitialized constant Recipe::PictureUploader
require 'carrierwave/orm/activerecord'
