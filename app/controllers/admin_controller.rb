class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize

  def index
    @users = User.all.paginate(page: params[:page], per_page: 10)
  end

  def update
    @user = User.find(params[:id])
    @user.remove_role @user.roles.first.name
    @new_role = params[:role]
    @user.add_role @new_role
    redirect_to '/admin'
  end

  def banned
    @user = User.find(params[:id])

    case
      when @user.banned?
        @user.notdeleted!
      when @user.notdeleted?
        @user.banned!
    end

    redirect_to '/admin'
  end

  private

  def authorize
    if !current_user.has_role? :admin
      render text: 'No access for you!'
    end
  end

end
