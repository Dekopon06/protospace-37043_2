class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :new]
    # before_action :move_to_index, except: [:index, :show]
   def index
    # user = User.find(params[id])
    # params.require(:tweet).permit(:name)
    # @name = user_name
   end

   def new
     @prototype = Prototype.new
   end

   def create
     @prototype = Prototype.create(prototype_params[:id])
    #  @prototype = Prototype.new(prototype_params[:id])
     if @prototype.save
      #  Prototype.create(prototype_params[:id])
      # current_user.create
      # (prototype_params[:id])
      redirect_to root_path
    else
      render :new
    end
   end


   private

   def prototype_params
     params.require(:prototype).permit( :title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
   end

   def configure_permitted_parameters
    d.permit(:sign_up, keys: [:user_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:password_confirmation])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:occupation])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:position])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end


end




# def move_to_index
#   unless user_signed_in?
#     redirect_to action: :index
#   end
# end