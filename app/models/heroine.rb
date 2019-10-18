class Heroine < ApplicationRecord
    belongs_to :power

    validates :super_name, uniqueness: true
    validates :name, presence: true
    validates :power_id, presence: true

    # if someone does search for a superpower name, get that superpower id
    # query the Heroines table for power_ids matching the input id
    # return those results
    # else (if no searches have been made)
    # return all Heroines
    def self.search(search)
       if search
        power = Power.find_by(name: power)
       else
        Heroine.all
       end
    end
end
