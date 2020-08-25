class PlatformAccount < ApplicationRecord
  cattr_accessor :form_steps do
    %w(subscription seats)
  end

  attr_accessor :form_step

  belongs_to :user
  belongs_to :platform
  has_many :account_seats
  has_one :chatroom

  validates :account_type, presence: true,
        if: -> { required_for_step?(:subscription) }

  validates :seats_total, :seats_available, presence: true,
        if: -> { required_for_step?(:seats) }

  def required_for_step?(step)
  # All fields are required if no form step is present
  return true if form_step.nil?

  # All fields from previous steps are required if the
  # step parameter appears before or we are on the current step
  return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
end
end
