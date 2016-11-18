class Restaurant < ActiveRecord::Base
  has_many :reviews,  dependent: :destroy
  belongs_to :user
  delegate :email, to: :user, prefix: true

  def average_rating
    @restaurant = Restaurant.find(self.id)
    count = 0
    total = 0
    @restaurant.reviews.each do |r|
      count += 1
      total += r.rating
    end
    return "No reviews" if count == 0
    total/count
  end

  def build_review(attributes = {}, user)
    review = reviews.build(attributes)
    review.user = user
    review
  end
end
