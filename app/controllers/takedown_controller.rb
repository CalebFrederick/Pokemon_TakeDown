class TakedownController < ApplicationController
require 'poke-api-v2'

def take_down
  #pokemon_types = PokeApi.get(pokemon: params[:pokemon]).types[0].type.name
  pokemon_types = PokeApi.get(pokemon: params[:pokemon]).types.map{ |type| type.type.name}
  #weaknesses = PokeApi.get(type: pokemon_types).damage_relations
  render json: pokemon_types
end

end