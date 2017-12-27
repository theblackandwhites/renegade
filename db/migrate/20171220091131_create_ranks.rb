class CreateRanks < ActiveRecord::Migration[5.0]
  def change
    create_table :ranks do |t|
      t.string :title
      t.integer :order

      t.timestamps
    end
  end
end
