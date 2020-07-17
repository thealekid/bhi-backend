class CreateHairProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :hair_products do |t|

      t.timestamps
    end
  end
end
