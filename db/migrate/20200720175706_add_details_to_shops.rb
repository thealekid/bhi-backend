class AddDetailsToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :address, :string
    add_column :shops, :town, :string
    add_column :shops, :county, :string
    add_column :shops, :country, :string
    add_column :shops, :postcode, :string
  end
end
