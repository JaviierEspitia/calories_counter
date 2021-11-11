class Calorie < ApplicationRecord
  belongs_to :user

  validates :quantity_calories, presence: true
  validates :comment, presence: true

  validate :day_future
  
  private
  def day_future
    
    if self.day > Date.today
      errors.add(:day, message: "chosen date in the future")
    end    
    errors.add(:day, message: "day cannot be blank") if day.nil?
  end

end
