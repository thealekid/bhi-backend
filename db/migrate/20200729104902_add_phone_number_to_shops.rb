class AddPhoneNumberToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :phone_number, :string
  end
end
