# == Schema Information
#
# Table name: players
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  user            :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin           :boolean          default(FALSE)
#

class Player < ActiveRecord::Base
  attr_accessible :name, :password_confirmation, :password, :user
  has_secure_password

  has_one :ranking
  has_many :PlayerMatches
  has_many :matches, :through => :PlayerMatches


  before_save :create_remember_token
  
  validates :name, presence: true, length: { maximum: 30 }
  
  VALID_USER_REGEX = /\A[\w-]{3,15}\z/i
  validates :user,  presence: true, format: { with: VALID_USER_REGEX },
                       uniqueness: { case_sensitive: false }
  
   
  validates :password, presence: true, length: { minimum: 6} 
  
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end

