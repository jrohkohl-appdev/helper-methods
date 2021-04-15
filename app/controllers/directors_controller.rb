class DirectorsController < ApplicationController
  def index
    @directors = Director.order(created_at: :desc)

    respond_to do |format|
      format.json do
        render json: @directors
      end

      format.html
    end
  end

  def new
    @director = Director.new
  end

  def create
    director_attributes = params.require(:director).permit(:name, :dob, :country_of_birth)
    @director= Director.new(director_attributes)

    if @director.valid?
      @director.save
      redirect_to directors_url, notice: "Direcotr added successfully."
    else
      render "new"
    end

  end 

  def show
    @director = Director.find(params.fetch(:id))
  end

  def edit
    @director = Director.find(params.fetch(:id))
  end

  def update
    @director = Director.find(params.fetch(:id))
        
    director_attributes = params.fetch(:director).permit(:name, :dob, :country_of_birth)

    @director.update(director_attributes)

    if @director.valid?
      @director.save
      redirect_to director_url(@director), notice: "Updated successfully."
    else
      redirect_to director_url(@director), alert: "Failed to update successfully." 
    end
  end

  def destroy



    @director = Director.find(params.fetch(:id))

    @director.destroy

    redirect_to directors_url, notice: "Director deleted."


  end
end