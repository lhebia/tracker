class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable,:recoverable, :rememberable

  devise :database_authenticatable,:validatable

  has_many :bikes, dependent: :destroy
  has_many :rides, dependent: :destroy

  def full_name
    first_name.capitalize + " " + last_name.capitalize
  end
end
