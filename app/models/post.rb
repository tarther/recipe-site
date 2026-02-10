class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_users, through: :bookmarks, source: :user

  validates :title, :image, :ingredients, :description,
            :steps, presence: true

  
  #商品名検索
  scope :search_ingredient, ->(ingredient) {
    where("title LIKE :ing OR ingredients LIKE :ing", ing: "%#{ingredient}%") if ingredient.present?
  }
  
  #チェーン検索
  scope :filter_store, ->(store) {
    where(store: store) if store.present?
  }
end
