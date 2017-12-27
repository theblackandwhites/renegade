class Charge < ApplicationRecord
  belongs_to :user
  belongs_to :mission
  belongs_to :care_package
end
