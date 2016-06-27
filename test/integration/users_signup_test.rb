require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid user resistration" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path,
        user: {
          name:  "",
          password: "inv",
          password_confirmation: "alid"
        }
    end
    assert_template 'users/new'
  end
end
