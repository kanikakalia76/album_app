class Tagging < ApplicationRecord
  belongs_to :picture
  belongs_to :tag
end
