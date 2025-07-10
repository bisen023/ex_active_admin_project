class AdminUser < ApplicationRecord
  validates :mobile_no, presence: true, uniqueness: true, length: {is: 10}, numericality: {only_integer: true}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
