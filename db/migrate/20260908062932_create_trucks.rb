class CreateTrucks < ActiveRecord::Migration[8.1]
  def change
    create_table :trucks do |t|
      t.string :make
      t.string :model
      t.integer :year

      t.timestamps
    end
  end
end
