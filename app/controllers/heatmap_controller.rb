class HeatmapController < ApplicationController
  def index
    @response = Response.find_by_sql("SELECT driver_name, department, AVG(score) AS scores FROM responses
    left JOIN employees on employees.id=employee_id
    GROUP BY driver_name, department;")
    
    render json: @response, status: 201
  end
end
