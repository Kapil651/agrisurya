module OrganizationsHelper
  def organization_status(organization)
    if organization.active?
      tag.span("Active", class: "badge badge-active")
    else
      tag.span("Inactive", class: "badge badge-inactive")
    end
  end
end
