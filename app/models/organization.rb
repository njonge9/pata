class Organization < ApplicationRecord
    has_many :memberships, dependent: :destroy
    has_many :members, through: :memberships, source: :user
    has_many :listings
end
