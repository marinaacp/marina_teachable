class ReportsController < ApplicationController
  def index
    @courses = TeachableApiService.new.get_all_courses
  rescue Exception => e
    Rails.logger.error(YAML::dump(e))
  end

  def show
    service = TeachableApiService.new
    enrollments = service.get_all_enrollments(params[:id])
    @enrollments_data = enrollments.map do |enrollment|
      user_data = service.get_one_user(enrollment["user_id"])
      {
        name: user_data["name"],
        email: user_data["email"]
      }
    end
  rescue Exception => e
    Rails.logger.error(YAML::dump(e))
  end
end
