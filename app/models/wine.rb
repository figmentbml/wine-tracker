class Wine < ActiveRecord::Base

  validates :grape_varietal, presence: true

end
