class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :new]
    # before_action :move_to_index, except: [:index, :show]
   def index
    @prototypes = Prototype.all
    # user = User.find(params[id])
    # params.require(:tweet).permit(:name)
    # @name = user_name
   end

   def new
     @prototype = Prototype.new
   end

   def create
     @prototype = Prototype.new(prototype_params)
    if @prototype.save
       redirect_to root_path
    else
       render :new
    end
   end
    #  @prototype = Prototype.create(prototype_params[:id])
    #  @prototype = Prototype.new(prototype_params[:id])
    #  Prototype.create(prototype_params[:id])
    # current_user.create
    # (prototype_params[:id])

   private

   def prototype_params
      params.require(:prototype).permit( :title, :catch_copy, :concept, :image ).merge(user_id: current_user.id)
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