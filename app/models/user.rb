class User < ActiveRecord::Base
  validates :name,:email,:password,:phone ,presence:true
  validates :name, :length => { :minimum => 2 }
  validates :phone, :numericality=>true
  validates :email, :uniqueness => true
  validates :password, :length => { :in => 6..20 }
  has_one :image, as: :entity
  accepts_nested_attributes_for :image
end
