class TakedownController < ApplicationController
require 'poke-api-v2'

  def TakeDown
    
    response = PokeApi.get(pokemon: params[:pokemon])

    render json: response
  end
end
