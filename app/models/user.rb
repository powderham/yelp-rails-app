class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews, dependent: :destroy
  has_many :restaurants, dependent: :destroy
  has_many :reviewed_restaurants, through: :reviews, source: :restaurant

  def has_reviewed?(restaurant)
    reviewed_restaurants.include? restaurant
  end
end
