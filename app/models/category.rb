class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { maximum: 25, minimum: 3 }
end