class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :costumes
  has_many :bookings
  has_one_attached :photo

  ADDRESSES = ["Tokyo Tower", "Tokyo Skytree", "Tokyo Stadium", "Shibuya Stations", "Shinjuku Station", "Tokyo Station", "Shibuya Miyashita Park"]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
