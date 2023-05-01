class User
  include ActiveModel::SecurePassword
  include Mongoid::Document
  include Mongoid::Timestamps

  has_secure_password

  has_secure_password :recovery_password, validations: false

  attr_accessor :password_digest, :recovery_password_digest

  field :username, type: String
  field :email, type: String
  field :password_digest, type: String
  
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, :length => {:minimum => 9}, :on => :addUser
  

  
end
