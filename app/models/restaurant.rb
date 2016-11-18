class Restaurant < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
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
