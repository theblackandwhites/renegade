class AddRankToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :rank_id, :integer
  end
end
