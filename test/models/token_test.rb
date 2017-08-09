require 'test_helper'

class TokenTest < ActiveSupport::TestCase
  def setup
    @token = Token.new(nonce: SecureRandom.urlsafe_base64(30), user_id: 1)
  end

  test "nonce should be present" do
    @token.nonce = "   "
    assert_not @token.valid? "The token does not have a nonce."
  end

  test "nonce and user_id should be unique" do
    duplicate_nonce = @token.dup
    @token.save
    assert_not duplicate_nonce.valid? "The token is not unique."
  end
end
