class UsersController < ApplicationController
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated
    if @user.save
      flash[:notice] = "Your account has been created."
      redirect_to signup_url
    else
      flash[:notice] = "There was a problem creating you."
      render :new
    end

  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(user_params)
      flash[:notice] = "Account updated!"
      redirect_to users_url
    else
      render :edit
    end
  end

  private

   def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :name)
  end

end
