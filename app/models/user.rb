class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  has_many :listings, dependent: :destroy
  has_many :messages, dependent: :destroy
  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end

  def password_token_valid?
    (self.reset_password_sent_at + 4.hours) > Time.now.utc
  end

  def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    byebug
    save!
  end

  private

  def generate_token
    SecureRandom.hex(10)
  end
end
