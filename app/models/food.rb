class Food < ApplicationRecord
  after_create :save_to_database
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }

  private

  def save_to_database
    save
  end
end
