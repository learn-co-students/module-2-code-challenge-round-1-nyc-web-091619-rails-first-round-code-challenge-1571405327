class AddPowerIdToHeroines < ActiveRecord::Migration[5.1]
  def change
    add_reference :heroines, :power_id, :integer, foreign_key :true
  end
end
