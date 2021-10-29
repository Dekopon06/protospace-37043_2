class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :new, :show]
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
       render :show
    end
  end

    def show 
      @prototype = Prototype.find(params[:id])
      @comment = Comment.new
      @comments = @prototype.comments.includes(:user)
    end

    def edit
      @prototype = Prototype.find(params[:id])
    end

    def update
    prototype = Prototype.find(params[:id])
    
      if prototype.update(prototype_params)
        redirect_to prototype_path
      else
        redirect_to back
      end
    end

    def destroy
      prototype = Prototype.find(params[:id])
      if prototype.destroy
        redirect_to root_path
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