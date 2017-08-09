require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
     @user = User.new(name: "Erin Mahoney", email: "erin@test.com", marketing: true, articles: true, digest: true)
  end

  test "should be valid" do
    @user.name = " "
    assert_not @user.valid? "The user does not have a name."
  end

  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid? "The user does not have an email."
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid? "The email is not unique."
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[person@wrong,com person_at_wrong.org person.wrong@example. person@wrong_thing.com person@wrong+wrong.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "marketing is present" do
    @user.marketing = nil
    assert_not @user.valid? "Marketing value is not valid."
  end

  test "articles field is present" do
    @user.articles = nil
    assert_not @user.valid? "Articles value is not valid."
  end

  test "digest field is present" do
    @user.digest = nil
    assert_not @user.valid? "Digest value is not valid."
  end

end
