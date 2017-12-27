class CreateCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :charges do |t|
      t.references :user, foreign_key: true
      t.references :mission, foreign_key: true
      t.references :care_package, foreign_key: true
      t.decimal :amount
      t.string :status
      t.text :message

      t.timestamps
    end
  end
end
