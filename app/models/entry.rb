class Entry < ActiveRecord::Base
  #add relationship to model user
  belongs_to :user
  #set default by order
  default_scope -> { order('created_at DESC') }
  #Add picture when post entry
  mount_uploader :picture, PictureUploader
  #must have user_id can =nil in field
  validates :user_id, presence: true
  #must be valid title and have length limit 140
  validates :title, presence: true, length:{maximum:140}
  #must have valid body and have length limit 500
  validates :body, presence: true, length:{maximum:500}
  #should valid with image size
  validate :picture_size


  #private part
  private
  #define method to check size of image
  def picture_size
    #check if size of image is biger than 5 MB
    if picture.size > 5.megabytes
      #add error when user post entry
      errors.add(:picture," should be less tha 5MB")
    end
  end
end
