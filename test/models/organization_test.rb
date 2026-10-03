require "test_helper"

class OrganizationTest < ActiveSupport::TestCase
  test "requires a name" do
    organization = Organization.new(name: "  ", active: true)

    assert_not organization.valid?
    assert_includes organization.errors[:name], "can't be blank"
  end

  test "rejects a duplicate name regardless of case" do
    organization = Organization.new(name: "north field co-op", active: true)

    assert_not organization.valid?
    assert_includes organization.errors[:name], "has already been taken"
  end

  test "defaults active to true" do
    organization = Organization.new(name: "Riverbend Growers")

    assert organization.active?
  end

  test "strips surrounding whitespace from the name" do
    organization = Organization.create!(name: "  Valley Farms  ")

    assert_equal "Valley Farms", organization.name
  end
end
