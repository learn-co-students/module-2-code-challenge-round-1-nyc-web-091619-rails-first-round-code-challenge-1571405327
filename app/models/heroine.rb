class Heroine < ApplicationRecord
    belongs_to :power

    validates :super_name, uniqueness: true

    def self.fliter_by_power(power)
        Heroine.all.filter {|heroine| heroine.power.name == power }

    end
end
