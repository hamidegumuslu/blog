require 'carrierwave/orm/activerecord'
class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_and_belongs_to_many :categories

  validates :title, presence: true
  validates :body, presence: true

  accepts_nested_attributes_for :categories
end
