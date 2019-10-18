class Heroine < ApplicationRecord
   belongs_to :power


   validates_uniqueness_of :super_name



   def self.search(user_input)
        if user_input
            @superpower = Power.find_by(name: user_input)
       found = self.all.find_by(power: @superpower.id)
            found.each do |heroine|
                puts heroine.name 
            end 
        else 
          self.all
        end 
   end 

end
