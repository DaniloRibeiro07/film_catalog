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
                       released: params[:movie][:released] == '1',
                       status: params[:movie][:status] == '1')
    if @movie.save
      if params[:movie][:avatar]
        @movie.avatar.attach(params[:movie][:avatar])
      end
      flash[:notice] = 'Filme Cadastrado com sucesso'
      return redirect_to(movie_path(@movie.id))
    end
    render :new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(title: params[:movie][:title],
                     release_year: params[:movie][:release_year],
                     synopsis: params[:movie][:synopsis],
                     country_of_origin: params[:movie][:country_of_origin],
                     duration: params[:movie][:duration],
                     director_id: params[:movie][:director_id],
                     genre_id: params[:movie][:genre_id],
                     released: params[:movie][:released] == '1',
                     status: params[:movie][:status] == '1')

      if params[:movie][:avatar]
        @movie.avatar.attach(params[:movie][:avatar])
      end

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

  def draft; end

  def publish
    movie = Movie.find(params[:id])
    movie.published!
    redirect_to(draft_movies_path)
  end

  def remove_photo
    movie = Movie.find(params[:id])
    movie.avatar.purge
    redirect_to(edit_movie_path(params[:id]))
  end
end
