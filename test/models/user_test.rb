require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "requires first name, last name, email, and role" do
    user = User.new(password: "Password123!", password_confirmation: "Password123!")

    assert_not user.valid?
    assert_includes user.errors[:first_name], "can't be blank"
    assert_includes user.errors[:last_name], "can't be blank"
    assert_includes user.errors[:email], "can't be blank"
    assert_includes user.errors[:role], "can't be blank"
  end

  test "rejects an unknown role" do
    user = User.new(
      first_name: "Asha",
      last_name: "Patel",
      email: "asha@example.com",
      role: "manager",
      password: "Password123!",
      password_confirmation: "Password123!"
    )

    assert_not user.valid?
    assert_includes user.errors[:role], "is not included in the list"
  end
end