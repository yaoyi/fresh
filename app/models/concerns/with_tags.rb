module WithTags
  extend ActiveSupport::Concern

  included do
    has_many :taggings, as: :taggable
    has_many :tags, through: :taggings
  end

  module ClassMethods
    def tagged_with(name)
      tag = Tag.find_by(name: name)
      model_name.name.constantize.joins(:taggings).where('taggings.tag_id = ?', tag.id)
    end
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    names = names.split(',').map(&:strip).uniq
    self.tags = names.map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
