class Post < ApplicationRecord
	scope :post_above_id_by_20, -> {where("id > ?", 20)}
	validates :title, presence: true
end
