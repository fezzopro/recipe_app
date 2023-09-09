class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :save_to_database

  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy
  validates :name, presence: true

  private

  def save_to_database
    save
  end
end
