class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :name, presence: true
  has_secure_password
  has_many :tasting_notes, dependent: :destroy

end
