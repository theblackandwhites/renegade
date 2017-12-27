class CarePackage < ApplicationRecord
	has_many :missions, through: :mission_care_packages
	has_many :charges
end
