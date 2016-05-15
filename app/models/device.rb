class Device < ApplicationRecord
  belongs_to :user
  validates :user_id, :bt_mac_address, :category, :name, :power, presence: true
end
