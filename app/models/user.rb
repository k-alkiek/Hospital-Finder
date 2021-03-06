class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews, dependent: :destroy
  has_attached_file :image,
                    :styles => { :large => "200x200>", :med => "100x100>", :small=>"60x60>" },
                    :path => ':rails_root/public/system/:class/:id/:style/:filename',
                    :url => '/system/:class/:id/:style/:filename',
                    :default_url => '/system/user_:style.png'

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
