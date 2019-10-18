class DropPowersColumnFromHeroines < ActiveRecord::Migration[5.1]
  def change
    remove_column :heroines, :powers_id
  end
end
