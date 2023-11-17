class Registration < ApplicationRecord
  belongs_to :event

  validates :name, presence: true

  validates :email, format: { with: /\S+@\S+/ }

  HOW_HEARD_OPTIONS = ["Newsletter", "Blog Post", "Twitter", "Web Search", "Friend/Coworker", "Other"]

  validates :how_heard, inclusion: { in: HOW_HEARD_OPTIONS }

  def self.current_registrations(user_email, event_id)
    Registration.where("email = ?", user_email).where("event_id = ?", event_id)
  end
end