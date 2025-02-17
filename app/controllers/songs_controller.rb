class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    # note_ids=params[:note_ids]

    @song = Song.new(song_params)

    # @song.note_contents= note_ids
#     @song = Song.new({
#   artist_name: params[:song][:artist_name],
#   genre_name: params
#   content: params[:post][:content]
# })

      temp_contents=params[:song][:note_contents]





    if @song.save
      @song.note_contents= temp_contents
      redirect_to song_path(@song)
    else
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
    params.require(:song).permit(:title, :artist_name, :genre_id, :note_contents)
  end
end
