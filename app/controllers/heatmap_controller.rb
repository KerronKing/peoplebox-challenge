class HeatmapController < ApplicationController
  def index
    @career_growth = Response.find_by_sql("SELECT department, AVG(score) AS scores FROM responses
    JOIN employees on employees.id=employee_id
    where driver_name='Career Growth'
    GROUP BY department;")
    @careers_hash = {}
    @career_growth.each do |entry|
      @careers_hash[entry.department] = entry.scores.round(2)
    end
  
    @company_policies = Response.find_by_sql("SELECT department, AVG(score) AS scores FROM responses
    JOIN employees on employees.id=employee_id
    where driver_name='Company Policies'
    GROUP BY department;")
    @policies_hash = {}
    @company_policies.each do |entry|
      @policies_hash[entry.department] = entry.scores.round(2)
    end
  
    @manager_support = Response.find_by_sql("SELECT department, AVG(score) AS scores FROM responses
    JOIN employees on employees.id=employee_id
    where driver_name='Manager Support'
    GROUP BY department;")
    @manager_hash = {}
    @manager_support.each do |entry|
      @manager_hash[entry.department] = entry.scores.round(2)
    end
  
    @role_clarity = Response.find_by_sql("SELECT department, AVG(score) AS scores FROM responses
    JOIN employees on employees.id=employee_id
    where driver_name='Role Clarity'
    GROUP BY department;")
    @role_hash = {}
    @role_clarity.each do |entry|
      @role_hash[entry.department] = entry.scores.round(2)
    end
  
    @main_response = [
      {
        driver: 'Career Growth',
        scores: @careers_hash
      },
      {
        driver: 'Company Policies',
        scores: @policies_hash
      },
      {
        driver: 'Manager Support',
        scores: @manager_hash
      },
      {
        driver: 'Role Clarity',
        scores: @role_hash
      },
    ]
   
    render json: @main_response, status: 201
  end
 end
 