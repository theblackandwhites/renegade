class FixColumnName < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :mission_care_packages, :care_packages_id, :care_package_id
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
