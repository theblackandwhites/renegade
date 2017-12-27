class CreateMissionCarePackages < ActiveRecord::Migration[5.0]
  def change
    create_table :mission_care_packages do |t|
      t.references :mission, foreign_key: true
      t.references :care_packages, foreign_key: true

      t.timestamps
    end
  end
end
