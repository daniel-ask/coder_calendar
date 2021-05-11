class PresentationsController < ApplicationController
  def index
    @presentations = Presentation.all
    @presentation = Presentation.new
  end

  def create
    Presentation.create(presentation_params)
    redirect_to presentations_path
  end

  def show
    @presentation = Presentation.find(params[:id])
    @entries = @presentation.presentation_entries
    @presentation_entry = PresentationEntry.new
  end

  def random
    @presentation = Presentation.find(params[:id])
    @entries = @presentation.presentation_entries.shuffle
    @presentation_entry = PresentationEntry.new
    
    render :show
  end

  private

  def presentation_params
    params.require(:presentation).permit(:name)
  end
end
