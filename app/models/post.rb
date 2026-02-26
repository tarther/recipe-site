class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_users, through: :bookmarks, source: :user
  
  validates :title, :image, :store,
            :steps, :product_1, presence: true

  
  #商品名検索
  scope :search_product, ->(product) {
    joins("LEFT JOIN products AS p1 ON posts.product_1 = p1.code")
    .joins("LEFT JOIN products AS p2 ON posts.product_2 = p2.code")
    .joins("LEFT JOIN products AS p3 ON posts.product_3 = p3.code")
    .where("title LIKE :pro OR p1.name LIKE :pro OR p2.name LIKE :pro OR p3.name LIKE :pro", pro: "%#{product}%") if product.present?
  }
  
  #チェーン検索
  scope :filter_store, ->(store) {
    where(store: store) if store.present?
  }

  def product_names
    [product_1, product_2, product_3].map do |code|
      Product.find_by(code: code)&.name
    end.compact
  end
end
