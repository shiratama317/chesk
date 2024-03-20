class SchedulesController < ApplicationController
  def index
    @family = Family.find(params[:family_id])
  end
end
