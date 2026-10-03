require "application_system_test_case"

class OrganizationsTest < ApplicationSystemTestCase
  setup do
    @organization = organizations(:one)
  end

  test "visiting the index" do
    sign_in_as_admin
    visit organizations_url

    assert_selector "h1", text: "Organizations"
    assert_text "North Field Co-op"
  end

  test "should create organization" do
    sign_in_as_admin
    visit organizations_url
    click_on "New organization"

    fill_in "Name", with: "Riverbend Growers"
    uncheck "Active"
    click_on "Create Organization"

    assert_text "Organization was successfully created"
    assert_text "Riverbend Growers"
    assert_text "Inactive"
  end

  test "should update Organization" do
    sign_in_as_admin
    visit organization_url(@organization)
    click_on "Edit"

    fill_in "Name", with: "Renamed Farm"
    uncheck "Active"
    click_on "Update Organization"

    assert_text "Organization was successfully updated"
    assert_text "Renamed Farm"
    assert_text "Inactive"
  end

  test "should destroy Organization" do
    sign_in_as_admin
    visit organization_url(@organization)
    accept_confirm do
      click_on "Delete"
    end

    assert_text "Organization was successfully destroyed"
    assert_no_text "North Field Co-op"
  end

  private

  def sign_in_as_admin
    visit new_user_session_path
    fill_in "Email", with: users(:admin).email
    fill_in "Password", with: "Password123!"
    click_on "Log in"
  end
end
