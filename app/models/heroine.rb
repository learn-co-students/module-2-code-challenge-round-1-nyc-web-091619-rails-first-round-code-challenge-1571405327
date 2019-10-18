class Heroine < ApplicationRecord
    belongs_to :power
    # validates :power, presence: true, uniqueness: true
    validates :super_name, presence: true, uniqueness: true

    def self.search(search)
        if search
            power = Power.find_by(name:search)
            if power
                self.where(power_id: power)
            else
                Power.all
            end
        else
            Power.all
        end
    end

end