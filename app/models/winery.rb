class Winery < ActiveRecord::Base

  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true


  def full_address
    "#{street} #{city} #{state} #{zip}"
  end

end
