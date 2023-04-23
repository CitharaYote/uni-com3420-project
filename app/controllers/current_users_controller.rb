class CurrentUsersController < ApplicationController
  before_action :set_current_user, only: %i[ show edit update destroy ]

  # GET /current_users
  def index
    @current_users = CurrentUser.all
  end

  # GET /current_users/1
  def show
  end

  # GET /current_users/new
  def new
    @current_user = CurrentUser.new
  end

  # GET /current_users/1/edit
  def edit
  end

  # POST /current_users
  def create
    @current_user = CurrentUser.new(current_user_params)

    if @current_user.save
      redirect_to @current_user, notice: "Current user was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /current_users/1
  def update
    if @current_user.update(current_user_params)
      redirect_to @current_user, notice: "Current user was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /current_users/1
  def destroy
    @current_user.destroy
    redirect_to current_users_url, notice: "Current user was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_current_user
      @current_user = CurrentUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def current_user_params
      params.require(:current_user).permit(:username, :email)
    end
end
