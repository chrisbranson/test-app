class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :destroy]
  before_action :set_micropost, only: [:destroy]

  # GET /microposts
  def index
    @microposts = Micropost.all
  end

  # POST /microposts
  def create
    @micropost = current_user.microposts.build(micropost_params)

    if @micropost.save
      flash[:success] = "Micropost created!"
    else
      flash[:error] = "Failed to create Micropost!"
    end

    redirect_to user_path(current_user)
  end

  # DELETE /microposts/1
  def destroy
    @micropost.destroy
    flash[:success] = "Micropost was successfully destroyed."
    redirect_to user_path(current_user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micropost_params
      params.require(:micropost).permit(:content, :user_id)
    end
end
