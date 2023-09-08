class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :save_to_database

  has_many :foods
  has_many :recipes
  validates :name, presence: true

  private

  def save_to_database
    save
  end
end
