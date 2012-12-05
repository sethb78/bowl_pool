# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  twitter    :string(255)
#  address1   :string(255)
#  address2   :string(255)
#  city       :string(255)
#  state      :string(255)
#  zip        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  FirstName  :string(255)
#  LastName   :string(255)
#

class User < ActiveRecord::Base

	before_save { |user| user.email = email.downcase }
  	attr_accessible :address1, :address2, :city, :email, :first_name, :last_name, :state, :twitter, :zip, :password, :password_confirmation, :middle_initial, :country, :email_confirmation

  	has_secure_password

  	validates :first_name, presence: true, length: { maximum: 25 }
 	validates :last_name, presence: true, length: { maximum: 25 }
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  	validates :email, confirmation: true
    validates :email_confirmation, presence: true
    validates :address1, presence: true
  	validates :city, presence: true
  	validates :state, presence: true
  	validates :zip, presence: true
  	validates :password, length: { minimum: 6 }
  	validates :password_confirmation, presence: true
end
