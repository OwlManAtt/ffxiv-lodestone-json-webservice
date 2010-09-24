class CharacterController < ApplicationController
  caches_page :index 
  def index
  end

  def profile 
    begin 
      if params[:type] == :by_id
        @character = FFXIVLodestone::Character.new(params[:id])
      elsif params[:type] == :by_name
        @character = FFXIVLodestone::Character.new(:name => params[:name], :world => params[:world])
      end
    rescue FFXIVLodestone::Character::NotFoundException => e
      render :status => 404, :text => {:error => 'Invalid character specified (or Lodestone is down).'}.to_json
    rescue FFXIVLodestone::Character::AmbiguousNameError => e
      render :status => 404, :text => {:error => 'Multiple characters matched the supplied name. Please load character by ID instead.'}.to_json
    rescue => e
      render :status => 500, :text => {:error => 'API must have a bug, please contact administrator.'}.to_json
    else
      respond_to do |format|
        format.html { render :text => "<pre>" + JSON.pretty_generate(JSON.parse(@character.to_json)) + "</pre>" }
        format.json { render :json => @character.to_json }
        format.yaml { render :text => @character.to_yaml }
      end
    end
  end
end
