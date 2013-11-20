class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def rescue404
    rescue_from ActiveRecord::RecordNotFound, :with => :rescue404
    rescue_from ActionController::RoutingError, :with => :rescue404
  end
end



# rspec test
# lambda {
#   visit '/something/you/want/to/404'
# }.should raise_error(ActionController::RoutingError)