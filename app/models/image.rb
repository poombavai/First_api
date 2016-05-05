class Image < ActiveRecord::Base
  belongs_to :entity, :polymorphic => true
  #belongs_to :user
  #belongs_to :product
  has_attached_file :photo
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
