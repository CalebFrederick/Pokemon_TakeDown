class AllPokemonController < ApplicationController
  
  def pokemon
    response = PokeApi.get(pokemon: {limit: 2000, page: 1}).results
  

    render json: response
  end
end
