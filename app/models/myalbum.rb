class Myalbum < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures 
  validates :name, presence: true 
  validates :description, presence: true 
end
