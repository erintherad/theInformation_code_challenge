require 'securerandom'

class Token < ApplicationRecord
  belongs_to :user
  validates :nonce, presence: true, uniqueness: true

  def generate(user)
    Token.create!(:nonce => SecureRandom.urlsafe_base64, :user_id => user.id)
  end

  def consume
  end
end
