class Picture < ApplicationRecord
  # belongs_to :user
    belongs_to :myalbum
    has_attached_file :photo, :styles => { :small => "50x50>"}
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  #added tag code
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

    def self.tagged_with(name)
    Tag.find_by!(name: name).articles
    end

  #def self.tag_counts
    #Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  #end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

end
