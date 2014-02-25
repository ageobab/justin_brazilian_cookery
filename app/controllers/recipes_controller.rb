class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = "New recipe has arrived.  Let's Cook Bro!"
      redirect_to recipe_path(@recipe.id)
    else
      flash[:error] = "There was an error saving your form."
      render :new 
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end


  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      flash[:notice] = "Recipe was updated. Get to cookin'."
      redirect_to recipe_path(@recipe.id)
    else
      flash[:error] = "There was an error saving your edits."
      render :edit
    end
  end


private 

  def recipe_params
    params.require(:recipe).permit(:title, :description, :cook_time, :instructions, :picture, :ingredients, :created_at, :updated_at)
  end

end



