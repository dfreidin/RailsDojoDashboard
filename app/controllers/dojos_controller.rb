class DojosController < ApplicationController
  before_action :set_dojo, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  end

  def create
    dojo = Dojo.create(process_dojo_form)
    redirect_to dojos_url
  end

  def show
    redirect_to dojo_students_url(params[:id])
  end

  def edit
  end

  def update
    @dojo.update(process_dojo_form)
    redirect_to dojo_url(@dojo.id)
  end

  def destroy
    @dojo.destroy
    redirect_to dojos_url
  end

  private
  def process_dojo_form
    params.require(:dojo).permit(:branch, :street, :city, :state)
  end
  def set_dojo
    @dojo = Dojo.find(params[:id])
  end
end
