class BloodRequest < ApplicationRecord
  belongs_to :user
  validates :name, :blood_group, :location, presence: true

  BLOOD_GROUPS = [ "A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-" ]
end
