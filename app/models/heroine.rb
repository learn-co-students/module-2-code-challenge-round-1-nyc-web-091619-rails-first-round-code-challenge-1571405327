class Heroine < ApplicationRecord
    belongs_to :power
    validates :super_name, presence: true, uniqueness: true

    def my_power
        self.power
    end

    


end
