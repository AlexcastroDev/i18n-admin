class ApplicationController < ActionController::API
  def render_message_errors(model)
    render status: :unprocessable_entity, json: {
       errors: model.errors.messages
    }
  end

  def render_results(model)
    if model.present?
      render json: model, status: :ok
    else
      render json: [], status: :ok
    end
  end
end
