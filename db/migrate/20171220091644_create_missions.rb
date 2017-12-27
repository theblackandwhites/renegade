class CreateMissions < ActiveRecord::Migration[5.0]
  def change
    create_table :missions do |t|
      t.string :title
      t.text :description
      t.string :video_url

      t.timestamps
    end
  end
end
