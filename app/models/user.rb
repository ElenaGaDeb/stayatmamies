class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :profile
  has_many :bookings
  has_one :apartment
  has_many :messages

  has_many :received_reviews, -> { where for_user_id: self.id }, class_name: 'Review'
  has_many :given_reviews, -> { where by_user_id: self.id }, class_name: 'Review'


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
