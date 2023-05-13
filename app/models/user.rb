class User
  include ActiveModel::SecurePassword
  include Mongoid::Document
  include Mongoid::Timestamps

  has_secure_password

  field :username, type: String
  field :email, type: String
  field :password_digest, type: String
  field :type, type: Integer
  field :token, type: String
  
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, :length => {:minimum => 9}, :on => :addUser
  

  
end
