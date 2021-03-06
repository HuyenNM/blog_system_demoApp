class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page])
  end

    #destroy
    def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end
  #end destroy
    def edit
    @user = User.find(params[:id])
  end

    def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  
  def new
    @user = User.new
  end

    def show
    @user = User.find(params[:id])      
    @entrys = @user.entrys.paginate(page: params[:page])
  end

    def create
	    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      sign_in @user
    	 flash[:success] = "Welcome to the Blog System!"
      redirect_to @user
    else
      render 'new'
    end
  	end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
