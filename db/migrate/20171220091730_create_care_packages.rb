class CreateCarePackages < ActiveRecord::Migration[5.0]
  def change
    create_table :care_packages do |t|
      t.string :title
      t.decimal :price

      t.timestamps
    end
  end
end
