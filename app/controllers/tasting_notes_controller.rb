class TastingNotesController < ApplicationController
  before_action :set_tasting_note, only: [:show, :edit, :update, :destroy]
  before_action :ensure_logged_in_user
  before_action :current_user_notes, only: [:show, :edit, :update, :destroy]

  def index
    @tasting_notes = TastingNote.all
  end

  def new
    @tasting_note = TastingNote.new
  end

  def create
    @tasting_note = TastingNote.new(tasting_notes_params)
    if @tasting_note.save
      redirect_to tasting_notes_path, notice: "Your note was successfully created!"
    else
      render :new
    end
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
    @tasting_note.destroy
    redirect_to tasting_notes_path, notice: "Your note was successfully deleted."
  end

  private
  def set_tasting_note
    @tasting_note = TastingNote.find(params[:id])
  end

  def tasting_notes_params
    params.required(:tasting_note).permit(
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
