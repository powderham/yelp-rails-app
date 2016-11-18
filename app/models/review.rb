class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
  delegate :email, to: :user, prefix: true
  validates :user, uniqueness: { scope: :restaurant, message: "has reviewed this restaurant already" }


end
