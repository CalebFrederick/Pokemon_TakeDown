class TakedownController < ApplicationController
require 'poke-api-v2'

def take_down
  pokemon_types = PokeApi.get(pokemon: params[:pokemon]).types.map{ |type| type.type.name}
  pokemon_sprite = PokeApi.get(pokemon: params[:pokemon]).sprites.front_default
  render json: {types: pokemon_types, sprite: pokemon_sprite}
end

def sprite 
  pokemon_sprite = PokeApi.get(pokemon: params[:pokemon]).sprites.front_default
  render json: pokemon_sprite
end

end