class PagesController < ApplicationController
  layout "agriculture"

  before_action :set_page_title

  def home; end

  def about; end

  def services; end

  def testimonials; end

  def blog; end

  def blog_details; end

  def contact; end

  private

  def set_page_title
    @page_title = PAGE_TITLES.fetch(action_name)
  end

  PAGE_TITLES = {
    "home" => "Home",
    "about" => "About Us",
    "services" => "Our Services",
    "testimonials" => "Testimonials",
    "blog" => "Blog",
    "blog_details" => "Blog Details",
    "contact" => "Contact"
  }.freeze
end
