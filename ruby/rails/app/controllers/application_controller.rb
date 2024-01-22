class ApplicationController < ActionController::API
  before_action :check_format!

  rescue_from ActionController::UnknownFormat do
    render status: :not_acceptable
  end

  private

  def check_format!
    raise ActionController::UnknownFormat unless request.format.json?
  end
end
