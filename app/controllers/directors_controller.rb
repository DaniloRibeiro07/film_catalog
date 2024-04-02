class DirectorsController < ApplicationController
  def new
    @director = Director.new
  end

  def create
    @director = Director.new(name: params[:director][:name],
                             nationality: params[:director][:nationality],
                             birthday: params[:director][:birthday],
                             genre_id: params[:director][:genre_id])

    if @director.save
      flash[:notice] = 'Diretor/a Cadastrado com sucesso'
      return redirect_to(director_path(@director.id))
    end
    render :new
  end

  def edit
    @director = Director.find(params[:id])
  end

  def show
    @director = Director.find(params[:id])
    @movie_director = Movie.joins(:director).where("name='#{@director.name}'")

  end

  def update
    @director = Director.find(params[:id])
    if @director.update(name: params[:director][:name],
                        nationality: params[:director][:nationality],
                        birthday: params[:director][:birthday],
                        genre_id: params[:director][:genre_id])
      flash[:notice] = 'Diretor/a Editado com sucesso'
      return redirect_to(director_path(params[:id]))
    end
    render :edit
  end
  
  def index
    render "_list"
  end
end
