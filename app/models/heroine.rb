class Heroine < ApplicationRecord
    belongs_to :Power
    validates_uniqueness_of :super_name
end
