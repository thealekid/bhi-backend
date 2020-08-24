class RemoveTypeFromShops < ActiveRecord::Migration[6.0]
  def change
    remove_column :shops, :type, :string
  end
end
