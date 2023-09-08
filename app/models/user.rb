class User < ApplicationRecord
  after_create :save_to_database

  has_many :foods
  has_many :recipes
  validates :name, presence: true

  private

  def save_to_database
    save
  end
end
