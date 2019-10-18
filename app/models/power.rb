class Power < ApplicationRecord
    has_many :heroines
    # validates :power, presence: true, uniqueness: true
end
