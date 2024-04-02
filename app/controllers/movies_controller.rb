class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(title: params[:movie][:title],
                       release_year: params[:movie][:release_year],
                       synopsis: params[:movie][:synopsis],
                       country_of_origin: params[:movie][:country_of_origin],
                       duration: params[:movie][:duration],
                       director_id: params[:movie][:director_id],
                       genre_id: params[:movie][:genre_id],
                       released: params[:movie][:released])
    if @movie.save
      flash[:notice] = 'Filme Cadastrado com sucesso'
      return redirect_to(movie_path(@movie.id))
    end
    render :new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @Movie = Movie.find(params[:id])
    if @Movie.update(title: params[:movie][:title],
                     release_year: params[:movie][:release_year],
                     synopsis: params[:movie][:synopsis],
                     country_of_origin: params[:movie][:country_of_origin],
                     duration: params[:movie][:duration],
                     director_id: params[:movie][:director_id],
                     genre_id: params[:movie][:genre_id],
                     released: params[:movie][:released] == '1')
      flash[:notice] = 'Filme Editado com sucesso'
      return redirect_to(movie_path(params[:id]))
    end
    render :edit
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def index
    render '_list'
  end
end
