class Restaurant < ActiveRecord::Base
  has_many :review

  def average_rating
    "test"
  end
end
