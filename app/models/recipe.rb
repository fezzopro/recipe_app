class Recipe < ApplicationRecord
  before_validation :set_defaults

  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :public, presence: true

  private

  def set_defaults
    self.public = false if public.blank?
  end
end
