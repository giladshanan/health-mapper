class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.text :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
