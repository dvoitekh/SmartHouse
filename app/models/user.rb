class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable

  has_many :devices

  ROLES = %w(client admin).freeze

  validates :name, :email, :password, :password_confirmation, presence: true

  validates :role, inclusion: ROLES

  ROLES.each do |r|
    define_method "is_#{r}?" do
      role == r
    end
  end
end
