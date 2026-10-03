class PublicController < ApplicationController
  def index
    @nav_links = [
      [ "Home", "#home" ],
      [ "Services", "#services" ],
      [ "Products", "#products" ],
      [ "About", "#about" ],
      [ "Contact", "#contact" ]
    ]

    @products = product_catalog

    @services = [
      {
        title: "Crop Management",
        icon: "🌾",
        description: "Advanced soil analysis, customized seed optimization, and organic farming advisory to maximize your seasonal yield layout."
      },
      {
        title: "Smart Equipment",
        icon: "🚜",
        description: "Access to modern tools, sustainable machinery management, and precise agritech integration built for field scale operations."
      },
      {
        title: "Market Distribution",
        icon: "📈",
        description: "Direct supply chain management matching raw, verified organic yield alongside wholesale commercial grocery chains."
      }
    ]
  end

  private

  PRODUCT_IMAGE_EXTENSIONS = %w[.jpg .jpeg .png .webp .gif].freeze
  PRODUCT_ACRONYMS = { "hdpe" => "HDPE" }.freeze

  def product_catalog
    directory = Rails.root.join("app/assets/images/products")
    return [] unless directory.directory?

    Dir.children(directory).filter_map { |filename|
      extension = File.extname(filename).downcase
      next unless PRODUCT_IMAGE_EXTENSIONS.include?(extension)

      {
        title: product_title(filename),
        image: "products/#{filename}"
      }
    }.sort_by { |product| product[:title] }
  end

  def product_title(filename)
    File.basename(filename, ".*")
      .tr("_-", " ")
      .squeeze(" ")
      .split
      .map { |word| PRODUCT_ACRONYMS[word.downcase] || word.capitalize }
      .join(" ")
  end
end
