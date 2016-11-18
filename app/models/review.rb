class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user, dependent: :destroy
  delegate :email, to: :user, prefix: true
end
