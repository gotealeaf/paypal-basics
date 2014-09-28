class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  layout "application"

  # GET /courses
  def index
  end
end
