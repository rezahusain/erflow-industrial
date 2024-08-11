# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  address                :string
#  city                   :string
#  dob                    :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string
#  state                  :string
#  username               :string
#  zipcode                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  rolify
  after_create :assign_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :forms, class_name: 'PatientRequest', foreign_key: 'user_id', dependent: :destroy

  validates :role, presence: true
  validates :dob, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :username, presence: true, uniqueness: true, length: { in: 6..30 }
  validates :email, presence: true, uniqueness: true
  validates :zipcode, length: { is: 5 }

  def self.display_time
    current_time = DateTime.now
    cdt = current_time.strftime '%m/%d/%Y %H:%M'
    @time = "Current Date and Time: #{cdt}"
    @time
  end

  def assign_role
    if role == 'patient'
      add_role(:patient)
    elsif role == 'admin'
      add_role(:admin)
    end
  end
end
