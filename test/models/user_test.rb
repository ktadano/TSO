require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Test User")
  end

  test "should be valid" do
    assert_not @user.valid?
  end
end
