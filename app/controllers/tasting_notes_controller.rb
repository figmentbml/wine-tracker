class TastingNotesController < ApplicationController
  before_action :set_tasting_notes, only: [:show, :edit, :update, :destroy]

  def index
    @tasting_notes = TastingNote.all
  end

  def new
    @tasting_note = TastingNote.new
  end

  def create
    @tasting_note = TastingNote.new(tasting_notes_params)
    @tasting_note.save
  end

  def show
  end

  def edit
  end

  def update
    @tasting_note.update(tasting_notes_params)
    if tasting_note.save
      redirect_to tasting_note_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def set_tasting_notes
    @tasting_note = TastingNote.find(params[:id])
  end

  def tasting_notes_params
    params.required(:tasting_notes).permit(
    :wine_rating,
    :color_depth,
    :color_hue,
    :color_clarity,
    :aroma_intensity,
    :aroma_age,
    :aromas,
    :taste_dry,
    :taste_body,
    :taste_acid,
    :taste_tannin,
    :taste_balance,
    :taste_intensity,
    :flavors,
    :taste_finish,
    :notes,
    :wine_id,
    :user_id
    )
  end

end
