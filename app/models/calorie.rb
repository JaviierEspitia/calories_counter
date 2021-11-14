class Calorie < ApplicationRecord
  belongs_to :user

  validates :quantity_calories, presence: true
  validates :comment, presence: true
  validates :day, presence: true

  validate :day_future

  after_save :count_registers
  after_destroy :count_registers

  #metodo que me actualiza el numero de registros del usuario
  
  def count_registers
      user = User.find(user_id)
      numregistros = Calorie.where(user_id: user_id).count
      user.update(registers: numregistros)
  end
  
  private
  def day_future
    
    if self.kind != "Ingested" && self.kind != "Burned"
      errors.add(:kind, message: "oops something went wrong")
    end  

    if !day.blank?
      if day > Date.today
        errors.add(:day, message: "chosen date in the future")
      end
    end    
    
  end

end
