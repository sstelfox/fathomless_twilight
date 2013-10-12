class SearchController < ApplicationController
  def new
    @search_form = SearchForm.new
  end

  def create
    @search_form = SearchForm.new
    @bikes = @search_form.submit(search_form_params)
    render :new
  end

  private
  def search_form_params
    params.require(:search)
    params[:search].permit(:query)
  end
end
