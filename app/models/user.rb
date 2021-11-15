class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :calories

  attr_accessor :remember_token, :activation_token, :reset_token

  def create_reset_digest
    self.graph_token = User.new_token
    update_attribute(:graph_token, self.graph_token)
    update_attribute(:graph_sent_at, Time.zone.now)
  end
  
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def send_graph_email(email, id_user)
    UserMailer.graph_subject(email, id_user).deliver_now
  end

end
