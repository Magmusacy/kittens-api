class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:notice] = "New kitten created!"
      redirect_to root_path
    else
      flash.now[:alert] = "Oops, couldn't create your kitten."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.save
      flash[:notice] = "Kitten updated!"
      redirect_to @kitten
    else
      flash.now[:alert] = "Oops, couldn't update your kitten."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy

    # :see_other is apparantely needed because Turbo Drive doesn't work with standard 302 redirect and has to use 303 instead.
    flash[:notice] = "Kitten destroyed!"
    redirect_to root_path, status: :see_other
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
