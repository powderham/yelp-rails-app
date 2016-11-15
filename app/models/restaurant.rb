class Restaurant < ActiveRecord::Base
  has_many :review

  def average_rating
    @reviews = Review.all
    count = 0
    total = 0
    @reviews.each do |r|
      count += 1
      total += r.rating
    end
    total/count
  end
end
