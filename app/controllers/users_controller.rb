class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :finish_signup]

  # GET /users/:id.:format
  def show
    @user = User.find_by(id: params[:id])
    # authorize! :read, @user
    twitter_client = client(@user)
    @main_timeline = twitter_client.user_timeline
  end

  # GET /users/:id/edit
  def edit
    # authorize! :update, @user
  end

  # PATCH/PUT /users/:id.:format
  def update
    # authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        sign_in(@user == current_user ? @user : current_user, :bypass_sign_in => true)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user 
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        #@user.skip_reconfirmation!
        sign_in(@user, :bypass_sign_in => true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  # DELETE /users/:id.:format
  def destroy
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
  
  private

    def client(user)
      Twitter::REST::Client.new do |config|
        config.consumer_key        = "Zwnd9EFbLcTIOKQ9ABhDYiFoD"#"iS5BX4PblWTVv08r0uAMIfWLm"
        config.consumer_secret     = "ZOkop7eHzj2TA3d1LsebK4Xq0LLj2PXrYUOtwUd1s27PRCH9wi"
        config.access_token        = user.access_token
        config.access_token_secret = user.secret_token
      end
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      accessible = [ :name, :email ] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end
end