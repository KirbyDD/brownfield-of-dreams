class FriendshipsController < ApplicationController
  def create
    user = User.find_by(uid: params[:uid])
    @friendship = current_user.friendships.create!(friend_id: user.id)
    if @friendship.save
      flash[:notice] = "Added friend."
    else
      flash[:error] = "Unable to add friend."
    end
    redirect_to "/dashboard"
  end
end
