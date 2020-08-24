class RemovePhoneNumberFromShops < ActiveRecord::Migration[6.0]
  def change
    remove_column :shops, :phone_number, :integer
  end
end
