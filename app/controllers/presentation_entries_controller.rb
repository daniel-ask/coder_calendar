class PresentationEntriesController < ApplicationController
  def create
    @presentation = Presentation.find(params[:presentation_id])
    @presentation_entry = @presentation.presentation_entries.create(presentation_entry_params)
    redirect_to presentation_path(@presentation)
  end

  private
    def presentation_entry_params
      params.require(:presentation_entry).permit(:name)
    end
end
