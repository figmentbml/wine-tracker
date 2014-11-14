class Wine < ActiveRecord::Base

validates :grape_varietal, presence: true
validates :country, presence: true
validates :rating, presence: true

end
