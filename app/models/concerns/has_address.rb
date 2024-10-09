module HasAddress
    extend ActiveSupport::Concern

    included do
        has_one :address, as: :addressable, dependent: :destroy
        validates :address, presence: true
    end
end