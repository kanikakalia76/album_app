class Tag < ApplicationRecord
	has_many :taggings, dependent: :destroy
    has_many :pictures, through: :taggings
end
