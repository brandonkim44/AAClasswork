class CatsController < ApplicationController
  before_action :ensure_logged_in_to_create_cats, only: [:new, :create, :edit, :update ]
  
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit #we're given cat's id as wildcard  #params[:id] => cat's id
    #find owner of the cat (person who is logged in)
    #search among owner's cats to find our specific cat
    @owner = User.joins(:cats).where("cats.user_id = ?", current_user.id)
    @cat = Cat.joins(:owner).where('')
    if @owner
        @cat.update
        render :edit
    else
      redirect_to new_cat_url
    end
  end

  def update
    @owner = User.joins(:cats).where("cats.user_id = ?", current_user.id)
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end
