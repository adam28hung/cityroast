class AdministrationController < ApplicationController
  before_action :authenticate_administrator!
  before_action :set_function_title

  protected

  def after_sign_out_path_for(current_administrator)
    root_path
  end

  private

  def set_function_title
    @function_title = controller_name.singularize.classify.constantize.model_name.human
  end


end
