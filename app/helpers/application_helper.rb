module ApplicationHelper
  def agriculture_body_class
    {
      "home" => "index-page",
      "about" => "about-page",
      "services" => "services-page",
      "testimonials" => "testimonials-page",
      "blog" => "blog-page",
      "blog_details" => "blog-details-page",
      "contact" => "contact-page"
    }[controller.action_name] || ""
  end
end
