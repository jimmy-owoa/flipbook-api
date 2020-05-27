class FlippingBook < ApplicationRecord
  has_one_attached :file
  has_many_attached :images
end
