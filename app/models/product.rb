class Product < ApplicationRecord
  #codeカラムで一意性
  validates :code, presence: true, uniqueness: true
end
