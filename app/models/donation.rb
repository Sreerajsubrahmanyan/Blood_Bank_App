class Donation < ApplicationRecord
  belongs_to :user

  BLOOD_GROUPS = [ "A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-" ].freeze

  validates :name, :age, :weight, :blood_group, :last_donation_date, :location, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 18, message: "must be 18 or older" }
  validates :weight, numericality: { greater_than_or_equal_to: 50, message: "must be at least 50 kg" }
  validate :donation_gap_valid?

  private

  def donation_gap_valid?
    return unless last_donation_date.present? && user.present? && user.gender.present?

    gap_months = user.gender == "Male" ? 3 : 4
    next_eligible_date = last_donation_date + gap_months.months

    if next_eligible_date > Date.today
      errors.add(:last_donation_date, "You must wait #{gap_months} months before donating again.")
    end
  end
end
