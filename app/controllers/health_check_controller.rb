class HealthCheckController < ActionController::Base
  def index
  render plain: 'success', status: :ok
  end
end
