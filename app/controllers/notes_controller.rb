class NotesController < ApplicationController
    def create
      Note.create(note_params)
    end
   
    private
   
    def note_params
      params.require(:note).permit(:content, song_ids: [])
    end
  end