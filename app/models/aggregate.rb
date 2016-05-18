class Aggregate < ApplicationRecord
  belongs_to :device
  validates :date, :device_id, :energy, presence: true
end
