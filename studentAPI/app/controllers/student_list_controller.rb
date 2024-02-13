module API
  class StudentController < ApplicationController
    def index
      if params[:class_id].present?
        @students = Student.where(class_id: params[:class_id])
        render json: @students
      else
        render json: { error: "Class ID parameter is required" }, status: :bad_request
      end
    end
  end
end
