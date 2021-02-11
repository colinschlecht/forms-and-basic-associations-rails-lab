class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
    @genres = Genre.all
    @notes = Note.all
  end

  def create
    @notes = Note.all
    @genres = Genre.all
    @song = Song.new(song_params)
    # byebug
    
    
    if @song.save
      redirect_to @song
    else
      @notes = Note.all
      @genres = Genre.all
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:genre_id, :artist_name, :title, :note_contents => [])
  end
end

