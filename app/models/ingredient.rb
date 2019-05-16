class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses
  # before_destroy :check_for_doses
  validates :name, presence: true, uniqueness: true

  # def check_for_doses
  #   return false if doses.count.positive?
  # end
end
