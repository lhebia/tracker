class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable,:recoverable, :rememberable

  devise :database_authenticatable, :validatable, :registerable

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  has_many :bikes, dependent: :destroy
  has_many :rides, dependent: :destroy

  validates_uniqueness_of :email

  def full_name
    return "User" if first_name.nil? || last_name.nil?
    first_name.capitalize + " " + last_name.capitalize
  end
end
