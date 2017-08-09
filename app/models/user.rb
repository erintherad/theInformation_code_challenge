class User < ApplicationRecord
  has_many :tokens

  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates_inclusion_of :marketing, in: [true, false]
  validates_inclusion_of :articles, in: [true, false]
  validates_inclusion_of :digest, in: [true, false]
end
