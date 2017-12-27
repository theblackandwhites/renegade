class DashboardController < ApplicationController
  def billing
  	@charges = Charge.where(user_id: current_user.id).all
  end

  def sponsored_missions
  	@missions = UserMission.where(user_id: current_user.id).all
  end
end
