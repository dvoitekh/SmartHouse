class Device < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :user_id, :bt_mac_address, :category, :name, :power, presence: true
end
