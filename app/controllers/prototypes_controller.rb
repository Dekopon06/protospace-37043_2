class PrototypesController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  def index
    # user = User.find(params[id])
    # params.require(:tweet).permit(:name)
    # @name = user_name
  end
end

# private

def prototype_params
  params.require(:prototype).permit(:content, :image).merge(user_id: current_user.id)
end

def new
  # @prototype = Prototype.new
end

def create
  # @hoge = Huga
end

# def move_to_index
#   unless user_signed_in?
#     redirect_to action: :index
#   end
# end