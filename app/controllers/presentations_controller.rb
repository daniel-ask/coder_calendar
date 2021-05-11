class PresentationsController < ApplicationController
  def index
    @presentations = Presentation.all
    @presentation = Presentation.new
  end

  def create
    Presentation.create(presentation_params)
    redirect_to presentations_path
  end

  private

  def presentation_params
    params.require(:presentation).permit(:name)
  end
end
