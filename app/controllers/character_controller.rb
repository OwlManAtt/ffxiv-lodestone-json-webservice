class CharacterController < ApplicationController
  def index
  end

  def profile 
    id = params[:id]
    @character = FFXIVLodestone::Character.new(id)

    respond_to do |format|
      format.html { render :text => @character.to_json }
      format.json { render :json => @character.to_json }
    end
  end
end
