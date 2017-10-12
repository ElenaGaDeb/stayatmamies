class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_characteristics
  has_many :characteristics, through: :profile_characteristics
  # accepts_nested_attributes_for :characteristics


  has_attachment :photo

 # validates :username, uniqueness: true, presence: true
  #validates :first_name, presence: true
  #validates :last_name, presence: true
  #validates :city_from, presence: true
  #validates :profile_type, presence: true, inclusion: { in: ["host", "student"], allow_nil: false }

end
