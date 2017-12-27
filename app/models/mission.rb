class Mission < ApplicationRecord
	has_many :mission_care_packages
	has_many :care_packages, through: :mission_care_packages
	has_many :charges
	has_many :users, through: :user_missions

	accepts_nested_attributes_for :mission_care_packages
end
