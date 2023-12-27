class Api::LanguagesController < ApplicationController
  def index
    @language = Language.find(params[:id])
  end

  def show
    @languages = Language.all
    render_results(@languages)
  end

  def create
    @language = Language.new(language_params)
    if @language.save
      render json: @language, status: :created
    else
      render_message_errors(@language)
    end
  end

  def destroy

  end

  private

  def language_params
    params.require(:language).permit(:key, :label)
  end
end
