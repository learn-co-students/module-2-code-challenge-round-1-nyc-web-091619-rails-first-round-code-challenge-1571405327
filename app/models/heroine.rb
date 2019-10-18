class Heroine < ApplicationRecord
    belongs_to :powers
    validates :name, presence: true

end
