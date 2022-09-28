class TakedownController < ApplicationController
require 'poke-api-v2'

def take_down
  d_from = []
  pokemon_types = PokeApi.get(pokemon: params[:pokemon]).types.map{ |type| type.type.name}
  pokemon_sprite = PokeApi.get(pokemon: params[:pokemon]).sprites.front_default
  pokemon_type1 = pokemon_types.first()
  if pokemon_types.count > 1
    pokemon_type2 = pokemon_types.second()
  else 
    pokemon_type2 = ""
  end
  damage_from = PokeApi.get(type: pokemon_type1).damage_relations.double_damage_from
  for t in damage_from do
    d_from << t.name
  end
  
  damage_from1 = damage_from.first().name
  render json: {types: pokemon_types, sprite: pokemon_sprite, type1: pokemon_type1, type2: pokemon_type2, from: d_from}
end

def sprite 
  pokemon_sprite = PokeApi.get(pokemon: params[:pokemon]).sprites.front_default
  render json: pokemon_sprite
end

def damage
  damage_from = PokeApi.get(type: params[:type]).damage_relations

  render json: damage_from
end

end