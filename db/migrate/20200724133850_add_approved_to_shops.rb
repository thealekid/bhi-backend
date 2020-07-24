class AddApprovedToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :approved, :boolean, default: false
  end
end
