class Administration::AdministratorsController < AdministrationController

  before_action :set_administrator, only: [:show, :edit, :update, :destroy]

  def index
    @administrators = Administrator.all
  end

  def show
    redirect_to administration_administrators_path
  end

  def new
    @administrator = Administrator.new
  end

  def edit

  end

  def create
    @administrator = Administrator.new( administrator_params )
    if @administrator.save
      redirect_to administration_administrators_path, notice: '新增使用者成功'
    else
      flash[:alert] = "新增使用者失敗，請檢查以下訊息："
      render :new
    end
  end

  def update

    if params[:administrator][:password].blank?
      params[:administrator].delete(:password)
      params[:administrator].delete(:password_confirmation)
    end

    if @administrator.update_attributes( administrator_params )
      redirect_to administration_administrators_path
    else
      flash[ :alert ] = "編輯使用者失敗，請檢查以下訊息："
      render :edit
    end

  end

  def destroy
    @administrator.destroy if @administrator
    redirect_to administration_administrators_path,  :notice => '使用者刪除成功'
  end

  private

  def administrator_params
    params.require(:administrator).permit( :name, :email, :password, :password_confirmation)
  end

  def set_administrator
    begin
      @administrator = Administrator.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "It looks like that user does not exist"
      redirect_to administration_administrators_path
    end
  end

end
