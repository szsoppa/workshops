require 'pg'

class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews
  has_and_belongs_to_many :lists

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, format: { with: /\A\d+\.*\d{0,2}\z/ }

  def average_rating
    result = ActiveRecord::Base.connection.execute("select average_rating(#{self.id});")
    result.getvalue(0,0) != nil ? result.getvalue(0,0) : 2.5
  end

end
