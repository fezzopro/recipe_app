class User < ApplicationRecord
  after_create :save_to_database

  has_many :foods
  validates :name, presence: true

  private

  def save_to_database
    save
  end
end
