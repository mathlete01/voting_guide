class User < ApplicationRecord

  has_secure_password
  validates :username, length: { minimum: 3 }, uniqueness: true

  has_many :decisions, dependent: :destroy
  has_many :choices, through: :decisions

  def make_empty_decisions
    i = 0
    while i < Choice.all.length do 
        Decision.create(
            user: self, 
            choice: Choice.find(i+1), 
            decision: "", 
            link: "", 
            annotation: "")
            i += 1
    end
  end

end
