class Organization < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :active, inclusion: { in: [ true, false ] }

  before_validation :normalize_name

  private

  def normalize_name
    self.name = name.to_s.strip
  end
end
