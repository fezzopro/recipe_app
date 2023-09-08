class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  validates :name, presence: true
  validates :description, presence: true

  def recent_recipes(limit = 3)
    Recipe.limit(limit)
  end

  private

  def set_defaults
    self.public = false unless public
  end
end
