class TastingNote < ActiveRecord::Base

  belongs_to :user
  belongs_to :wine

  validates :wine_rating, presence: true
  validate :rating_cannot_be_greater_than_5, on: [:create, :update]

  def rating_cannot_be_greater_than_5
    if wine_rating.present? && (wine_rating < 0 || wine_rating > 5)
      errors.add(:wine_rating, "Ratings can only be 0-5")
    end
  end

end
