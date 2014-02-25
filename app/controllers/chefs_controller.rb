class ChefsController < ApplicationController

  def new
    @chef = Chef.new
  end

  def index
    @chefs = Chef.all
  end

  def show
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "New chef has arrived.  Let's Cook Bro!"
      redirect_to chef_path(@chef.id)
    else
      flash[:error] = "There was an error saving your form."
      render :new 
    end
  end

  def show
    @chef = Chef.find(params[:id])
  end

  def edit
    @chef = Chef.find(params[:id])
  end


  def update
    @chef = Chef.find(params[:id])
    if @chef.update_attributes(chef_params)
      flash[:notice] = "#{@chef.name} was updated. Get to cookin'."
      redirect_to chef_path(@chef.id)
    else
      flash[:error] = "There was an error saving your edits."
      render :edit
    end
  end


private 

  def chef_params
    params.require(:chef).permit(:name, :show, :specialty, :avatar)
  end

end


