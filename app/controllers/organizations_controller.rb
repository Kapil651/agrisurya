class OrganizationsController < ApplicationController
  layout "internal"

  before_action :authenticate_user!
  before_action :set_organization, only: %i[ show edit update destroy ]

  def index
    @organizations = Organization.order(:name)
  end

  def show
  end

  def new
    @organization = Organization.new
  end

  def edit
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      redirect_to @organization, notice: "Organization was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @organization.update(organization_params)
      redirect_to @organization, notice: "Organization was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @organization.destroy!
    redirect_to organizations_path, notice: "Organization was successfully destroyed.", status: :see_other
  end

  private

  def set_organization
    @organization = Organization.find(params.expect(:id))
  end

  def organization_params
    params.expect(organization: [ :name, :active ])
  end
end
