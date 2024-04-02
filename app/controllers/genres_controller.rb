class GenresController < ApplicationController
  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(name: params[:genre][:name])
    if @genre.save
      flash[:notice] = 'Gênero salvo com sucesso'
      return redirect_to(new_genre_path)
    end
    render :new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(name: params[:genre][:name])
      flash[:notice] = 'Gênero Editado com sucesso'
      return redirect_to(new_genre_path)
    end
    render :edit
  end

  def show
    @genre = Genre.find(params[:id])
    @movie_genre = Movie.joins(:genre).where("genres.name='#{@genre.name}'")
  end

  def index
    render "_list"
  end
end
