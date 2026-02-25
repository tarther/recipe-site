class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_users, through: :bookmarks, source: :user
  
  validates :title, :image,
            :steps, :product_1, presence: true

  
  #商品名検索
  scope :search_product, ->(product) {
    where("title LIKE :ing OR product_1 LIKE :ing", ing: "%#{product}%") if product.present?
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
