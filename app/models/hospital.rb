class Hospital < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews, dependent: :destroy
  
  has_attached_file :image,
                    :styles => { :large => "300x300>", :med => "100x100>", :small=>"60x60>" },
                    :path => ':rails_root/public/system/:class/:id/:style/:filename',
                    :url => '/system/:class/:id/:style/:filename',
                    :default_url => '/system/18471162_1354346434653862_1251350820_n.png'
                    
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/ico"]
end
