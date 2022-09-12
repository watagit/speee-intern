# frozen_string_literal: true

class HealthCheckController < ApplicationController
  def index
    render plain: 'success', status: :ok
  end
end
