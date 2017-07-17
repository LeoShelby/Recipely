class Menu < ApplicationRecord
  belongs_to :event
  
  belongs_to :primo, class_name: 'Recipe' , optional: true
  belongs_to :secondo, class_name: 'Recipe' , optional: true
  belongs_to :contorno, class_name: 'Recipe' , optional: true
  belongs_to :dessert, class_name: 'Recipe' , optional: true
end
