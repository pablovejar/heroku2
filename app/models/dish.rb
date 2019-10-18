class Dish < ApplicationRecord
    belongs_to :restaurant
    has_many :reviews
    accepts_nested_attributes_for :reviews
end
