require 'securerandom'

class Token < ApplicationRecord
  belongs_to :user
  validates :nonce, presence: true, uniqueness: true

  def self.generate(user)
    Token.create!(:nonce => SecureRandom.urlsafe_base64(30), :user_id => user.id)
  end

  def self.consume(nonce)
    token = Token.find_by(:nonce => nonce)

    if token
      token.destroy
      return token.user
    else
      return nil
    end
  end
end
