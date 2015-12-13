# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  name                   :string(255)
#  identity               :string(255)
#  birthdate              :date
#  district_id            :integer
#  role                   :integer
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  course_id              :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :course

  has_many :surveys
  has_many :inquiries, through: :surveys
  has_many :rated_congressmen, through: :inquiries, source: :congressman

  has_and_belongs_to_many :events
  belongs_to :district
  enum role: [:student, :citizen, :volunteer, :regular, :teacher]
  attr_reader :city
  attr_accessor :token
  validates_presence_of :name, :identity, :birthdate, :district_id, :role
  validate :identity_should_be_valid


  scope :wandering_students, -> { student.where(course_id: nil) }

  def city_district
    "#{district.city.name} - #{district.name}"
  end

  private

  def identity_should_be_valid
    errors.add(:identity, "不符合格式") unless TaiwaneseIdBuilder.valid?(identity)
  end
end
