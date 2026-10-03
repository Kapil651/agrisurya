class User < ApplicationRecord

  # Login, logout, and password reset. Sign-up is intentionally omitted.
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  before_validation :normalize_profile

  private

  def normalize_profile
    self.first_name = first_name.to_s.strip
    self.last_name = last_name.to_s.strip
  end
end
