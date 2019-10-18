class Heroine < ApplicationRecord
    belongs_to :power

    #Along with required unique super_name, I 
    #added validations that the name, super_name, and 
    #power are present. Comment out line 9 to toggle off

    validates_uniqueness_of :super_name
    validates :name, :super_name, :power, presence: true
end
