class User < ApplicationRecord
  ROLES = %w[admin customer].freeze

  # Login, logout, and password reset. Sign-up is intentionally omitted.
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
  validates :role, presence: true, inclusion: { in: ROLES }

  before_validation :normalize_profile

  private

  def normalize_profile
    self.first_name = first_name.to_s.strip
    self.last_name = last_name.to_s.strip
    self.role = role.to_s.strip.downcase
  end
end
