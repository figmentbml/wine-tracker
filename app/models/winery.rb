class Winery < ActiveRecord::Base
  mount_uploader :winery_pic, WineryPicUploader

  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone_number, presence: true

  has_many :wines

  def full_address
    "#{street} #{city} #{state} #{zip}"
  end

  def upload
    uploaded_io = params[:winery][:winery_pic]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    w = Winery.new
    w.winery_pic = params[:file]
    w.save!

  end



end
