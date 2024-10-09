class Address < ApplicationRecord
    belongs_to :addressable, polymorphic: true

    validates :line_1, presence: true
    validates :line_2, presence: true
    validates :city, presence: true
    validates :postcode, presence: true
    validates :country, presence: true
end
