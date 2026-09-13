module ApplicationHelper
  def product_image_tag(product, **html_options)
    if product.image_available?
      image_tag product.image_url, { alt: product.name }.merge(html_options)
    else
      tag.div class: [ "product-placeholder", html_options[:class] ].compact.join(" ") do
        tag.span product.name.to_s.presence || "にゃんこグッズ"
      end
    end
  end
end
