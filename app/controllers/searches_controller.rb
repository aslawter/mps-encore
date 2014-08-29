class SearchesController < ApplicationController
  def show
    @found_results = run_search
  end

  private

  def run_search
    Performance.where("title ILIKE :search OR description ILIKE :search", search: "%#{params[:search]}%")
  end
end
