class MissionCarePackage < ApplicationRecord
  belongs_to :mission, required: false
  belongs_to :care_package, required: false
end
