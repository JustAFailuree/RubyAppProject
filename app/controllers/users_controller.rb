class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  skip_before_action :set_user, only: [:destroy]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    @recipe.user_id = session[:user_id]

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /login
  def login
    if request.post?
      user = User.find_by(email: params[:email])

      if user && user.password == params[:password]
        session[:user_id] = user.id 
        redirect_to dashboard_path, notice: "Zalogowano pomyślnie."
      else
        flash.now[:alert] = "Nieprawidłowy e-mail lub hasło."
        render :login, status: :unprocessable_entity
      end
    else
      render :login
    end
  end

  def destroy
    reset_session 
    redirect_to root_path, notice: "Successfully logged out." 
    end





  def dashboard

end

  # GET /register
  # POST /register
  def register
    if request.post?
      @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        redirect_to login_path, notice: "Rejestracja zakończona sukcesem! Zaloguj się."
      else
        render :register, status: :unprocessable_entity
      end
    else
      @user = User.new
      render :register
    end
  end





  # POST /register
  def create_user
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Rejestracja zakończona sukcesem!"
    else
      render :register, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :last_name, :email, :birth_date, :password)
  end
  end
