class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable
    # validates :name, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }

    has_many :memberships, dependent: :destroy
    has_many :organizations, through: :memberships
    has_many :listings, foreign_key: :creator_id, dependent: :destroy
end
