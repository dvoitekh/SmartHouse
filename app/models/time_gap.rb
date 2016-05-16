class TimeGap < ApplicationRecord
  has_and_belongs_to_many :devices
  validates :start, :end, presence: true
end
