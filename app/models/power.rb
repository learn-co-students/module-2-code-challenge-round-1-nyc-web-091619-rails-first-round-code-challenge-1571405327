class Power < ApplicationRecord
    has_many :heroines

    #I added validation that name is present
    #and unique. Comment out line 6 to toggle off
    validates :name, uniqueness: true, presence: true
end
