require "test_helper"

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization = organizations(:one)
    sign_in users(:admin)
  end

  test "redirects guests to the login page" do
    sign_out users(:admin)

    get organizations_url

    assert_redirected_to new_user_session_url
  end

  test "should get index" do
    get organizations_url
    assert_response :success
  end

  test "should get new" do
    get new_organization_url
    assert_response :success
  end

  test "should create organization" do
    assert_difference("Organization.count") do
      post organizations_url, params: { organization: { active: false, name: "Riverbend Growers" } }
    end

    organization = Organization.last
    assert_equal "Riverbend Growers", organization.name
    assert_not organization.active?
    assert_redirected_to organization_url(organization)
  end

  test "rejects an organization without a name" do
    assert_no_difference("Organization.count") do
      post organizations_url, params: { organization: { active: true, name: "" } }
    end

    assert_response :unprocessable_entity
  end

  test "should show organization" do
    get organization_url(@organization)
    assert_response :success
  end

  test "should get edit" do
    get edit_organization_url(@organization)
    assert_response :success
  end

  test "should update organization" do
    patch organization_url(@organization), params: { organization: { active: false, name: "Renamed Farm" } }

    assert_redirected_to organization_url(@organization)
    @organization.reload
    assert_equal "Renamed Farm", @organization.name
    assert_not @organization.active?
  end

  test "should destroy organization" do
    assert_difference("Organization.count", -1) do
      delete organization_url(@organization)
    end

    assert_redirected_to organizations_url
  end
end
