class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :products

  validates :firstname, presence: true
  validates :lastname, presence: true

  after_save :defaults

  def defaults
    admin ||= false
  end
end
