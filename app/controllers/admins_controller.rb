class AdminsController < ApplicationController
  def show
    @users = User.inactive.newest_first
  end
end
