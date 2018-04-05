class DojosController < ApplicationController
  def index
  end

  def new
  end

  def create
    dojo = Dojo.create(process_dojo_form)
    redirect_to dojos_url
  end

  private
  def process_dojo_form
    params.require(:dojo).permit(:branch, :street, :city, :state)
  end
end
