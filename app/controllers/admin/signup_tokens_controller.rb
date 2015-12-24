class Admin::SignupTokensController < Admin::BaseController
  def index
    @acitve_signup_tokens = SignupToken.active.recent
    @inacitve_signup_tokens = SignupToken.inactive.recent
  end

  def new
    @signup_token = SignupToken.new
  end

  def create
     @signup_token = SignupToken.new(signup_token_params)
    if @signup_token.save
      flash[:success] = "成功建立新 Token"
      redirect_to admin_signup_tokens_path
    else
      render :new
    end
  end

  def toggle_active
    @signup_token = SignupToken.find(params[:id])
    @signup_token.toggle_active!

    flash[:success] = "成功。"
    redirect_to admin_signup_tokens_path
  end

  private

  def signup_token_params
    params.require(:signup_token).permit(:token_type)
  end
end
