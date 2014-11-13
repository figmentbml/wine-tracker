class Winery < ActiveRecord::Base

validates :name, presence: true
validates :street, presence: true
validates :city, presence: true
validates :state, presence: true
validates :zip, presence: true
validates :phone_number, presence: true
validates :email, presence: true


  def full_address
    "#{@winery.street} #{@winery.city} #{@winery.state} #{@winery.zip}"
  end

end
