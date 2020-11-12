class User < ApplicationRecord
  has_secure_password
  validates :username, length: { minimum: 3 }, uniqueness: true
  #belongs_to :city
  has_many :decisions, dependent: :destroy
  has_many :choices, through: :decisions

  def authenticate(plaintext_pass)
    if BCrypt::Password.new(self.password_digest) == plaintext_pass
      self  
    else
      false
    end
  end 
end
