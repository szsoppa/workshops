class Category < ActiveRecord::Base
  has_many :products, autosave: true

  validates :name, uniqueness: { case_sensitive: true }
end
