class UserInfo < ActiveRecord::Base
    #attr_accessible :user_id , :name , :image
    belongs_to :user
    validates :first_name, :last_name, :phone_number, :presence => true
    after_create :create_account
    mount_uploader :image, ImageUploader
    #validates_format_of :image, :with => %r{\.(jpg|jpeg)$}i, :message => "Only JPG Format"
    validate :image_size_validation

    private
    def create_account
        Account.create(user_id: user_id, balance: 0.0)
    end 
         def image_size_validation
    errors[:image] << "should be less than 5MB" if image.size > 5.megabytes
  end
  end