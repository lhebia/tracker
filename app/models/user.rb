class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable,:recoverable, :rememberable

  devise :database_authenticatable, :validatable

  belongs_to :account, dependent: :destroy

  has_many :bikes, dependent: :destroy
  has_many :rides, dependent: :destroy

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_uniqueness_of :email

  def full_name
    first_name.capitalize + " " + last_name.capitalize
  end
end
