class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence:
  validates :description, presence: true

  def recent_recipes(limit = 3)
    Recipe.limit(limit)
  end

  private

  def set_defaults
    self.public = false unless public
  end
end
