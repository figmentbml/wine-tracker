class Wine < ActiveRecord::Base

  validates :grape_varietal, presence: true
  validates :name, presence: true

  belongs_to :winery
  has_many :tasting_notes


  def self.varietals
    [
      'Barbera',
      'Cabernet Franc',
      'Cabernet Sauvingnon',
      'Chardonnay',
      'Grenache',
      'Gewurztraminer',
      'Malbec',
      'Marsanne',
      'Merlot',
      'Mourvedre',
      'Muscat',
      'Petite Sirah',
      'Petite Verdot',
      'Pinot Noir',
      'Pinot Gris',
      'Riesling',
      'Roussanne',
      'Sangiovese',
      'Sauvignon Blanc',
      'Semillon',
      'Syrah',
      'Shiraz',
      'Tannat',
      'Tempranillo',
      'Viognier',
      'Zinfandel',
      'Blend',
      'Other'
    ]
  end

  def self.states
    [
      'Alabama',
      'Alaska',
      'Arizona',
      'Arkansas',
      'California',
      'Colorado',
      'Connecticut',
      'Delaware',
      'Flordia',
      'Georgia',
      'Hawaii',
      'Idaho',
      'Illinois',
      'Indiana',
      'Iowa',
      'Kansas',
      'Kentucky',
      'Louisiana',
      'Maine',
      'Maryland',
      'Massachusetts',
      'Michigan',
      'Minnesota',
      'Mississippi',
      'Missouri',
      'Montana',
      'Nebraska',
      'Nevada',
      'New Hampshire',
      'New Jersey',
      'New Mexico',
      'New York',
      'North Carolina',
      'North Dakota',
      'Ohio',
      'Oklahoma',
      'Oregon',
      'Pennsylvania',
      'Rhode Island',
      'South Carolina',
      'South Dakota',
      'Tennessee',
      'Texas',
      'Utah',
      'Vermont',
      'Virginia',
      'Washington',
      'West Virgina',
      'Wisconsin',
      'Wyoming'
    ]
  end



end
