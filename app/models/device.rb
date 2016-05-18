class Device < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :aggregates
  has_and_belongs_to_many :time_gaps
  validates :user_id, :bt_mac_address, :category, :name, :power, presence: true
end
