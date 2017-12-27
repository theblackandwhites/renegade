class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :mobile, :string
    add_column :users, :country, :string
    add_column :users, :postcode, :string
    add_column :users, :stripe_customer_id, :string
    add_column :users, :stripe_last4, :string
    add_column :users, :stripe_brand, :string
    add_column :users, :stripe_exp_month, :string
    add_column :users, :stripe_exp_year, :string
  end
end
