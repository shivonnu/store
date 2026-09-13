class Product < ApplicationRecord
  scope :sacred, -> { where("name LIKE ?", "[★]%") }

  def sacred?
    name.to_s.start_with?("[★]")
  end

  def image_available?
    image_url.present? && Rails.root.join("app/assets/images", image_url).exist?
  end
end
