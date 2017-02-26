class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  load_and_authorize_resource

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)

    if(@category.save)
      redirect_to categories_path, notice: 'Your question will be examined by the moderator'
    else
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])

    if(@category.update(category_params))
      redirect_to @category
    else
      render 'edit'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id]).destroy

    redirect_to categories_path
  end

  def index
    @categories = Category.published.paginate(page: params[:page], per_page: 7)
  end

  def admin
    @categories = Category.all.paginate(page: params[:page], per_page: 7)
  end

  def publish
    @category = Category.find(params[:id])

    case
      when @category.draft?
        @category.published!
      when @category.published?
        @category.draft!
    end

    redirect_to categories_admin_path
  end

  def show
    @category = Category.find(params[:id])
    @messages = @category.messages.paginate(page: params[:page], per_page: 7)
  end

  private def category_params
    params.require(:category).permit(:title, :body)
  end
end
