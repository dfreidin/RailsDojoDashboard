class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :set_dojo, only: [:index, :new]

  def index
  end

  def new
  end

  def create
    student = Student.new(process_student_form)
    set_student_dojo(student)
    redirect_to dojo_students_url
  end

  def show
  end

  def edit
  end

  def update
    @student.update(process_student_form)
    set_student_dojo(@student)
    redirect_to dojo_student_url(@student.dojo.id, @student.id)
  end

  def destroy
    @student.destroy
    redirect_to dojo_students_url
  end

  private
  def process_student_form
    params.require(:student).permit(:first_name, :last_name, :email)
  end
  def set_student_dojo student
    student.dojo = Dojo.find_by(branch: params[:student][:dojo])
    student.save
  end
  def set_student
    @student = Student.find(params[:id])
  end
  def set_dojo
    @dojo = Dojo.find(params[:dojo_id])
  end
end
