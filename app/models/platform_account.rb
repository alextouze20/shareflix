class PlatformAccount < ApplicationRecord
  cattr_accessor :form_steps do
    %w(subscription seats)
  end

  # SUBSCRIPTION_TYPES = [
  #   "Family",
  #   "Personal"
  # ]

  # PAYMENT_FREQUENCIES = [
  #   "Monthly",
  #   "Annually"
  # ]

  attr_accessor :form_step

  belongs_to :user
  belongs_to :platform
  has_many :account_seats
  has_one :chatroom
  # has_one :subscription_type

  validates :account_type, presence: true,
        if: -> { required_for_step?(:subscription) }

  with_options if: -> { required_for_step?(:seats) } do |step|
    step.validates :seats_total, :seats_available, presence: true
    step.validate :seats_total_must_be_superior
    step.validates :seats_available, numericality: { greater_than_or_equal_to: 1,
                                                     less_than_or_equal_to: :seats_total }
  end

  def seats_total_must_be_superior
    lower_bound = seats_available || 1
    if seats_total < lower_bound
      errors.add(:seats_total, "The total number of seats must be greater than #{lower_bound}")
    elsif seats_total > platform.max_seats_available
      errors.add(:seats_total, "This platform can't have that many people sharing it!")
    end
  end

  def required_for_step?(step)
    # All fields are required if no form step is present
    return true if form_step.nil?

    # All fields from previous steps are required if the
    # step parameter appears before or we are on the current step
    return true if form_steps.index(step.to_s) <= form_steps.index(form_step)
  end
end
