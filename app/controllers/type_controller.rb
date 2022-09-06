class TypeController < ApplicationController
  require 'poke-api-v2'

  def type
    response = PokeApi.get(type: params[:type]).damage_relations

    render json: response
  end
end
