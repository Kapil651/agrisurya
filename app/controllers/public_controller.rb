class PublicController < ApplicationController
  def index
    @nav_links = [
      [ "Home", "#home" ],
      [ "Services", "#services" ],
      [ "About", "#about" ],
      [ "Contact", "#contact" ]
    ]

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
end
