class Provider < ApplicationRecord
  geocoded_by :full_address
  after_initialize :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def full_address
    ["USA", "Chicago", self.address].compact.join(", ")
  end

end
