class Product < ApplicationRecord
  has_many :orders, dependent: :destroy
  include PgSearch::Model

  belongs_to :user
  has_one_attached :photo
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_float: true }
  validates :quantity, presence: true, numericality: { only_integer: true }

  pg_search_scope :search_by_title_and_syllabus,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
