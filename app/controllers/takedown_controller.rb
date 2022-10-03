class TakedownController < ApplicationController
require 'poke-api-v2'

def take_down
  double_from1 = []
  half_from1 = []
  none_from1 = []
  double_from2 = []
  half_from2 = []
  none_from2 = []

  pokemon_types = PokeApi.get(pokemon: params[:pokemon]).types.map{ |type| type.type.name}
  pokemon_sprite = PokeApi.get(pokemon: params[:pokemon]).sprites.front_default
  pokemon_type1 = pokemon_types.first()
  if pokemon_types.count > 1
    pokemon_type2 = pokemon_types.second()
  else 
    pokemon_type2 = ""
  end

  double_damage_from1 = PokeApi.get(type: pokemon_type1).damage_relations.double_damage_from
  for t in double_damage_from1 do
    double_from1 << t.name
  end

  half_damage_from1 = PokeApi.get(type: pokemon_type1).damage_relations.half_damage_from
  for t in half_damage_from1 do
    half_from1 << t.name
  end

  none_damage_from1 = PokeApi.get(type: pokemon_type1).damage_relations.no_damage_from
  for t in none_damage_from1 do
    none_from1 << t.name
  end

  double_damage_from2 = PokeApi.get(type: pokemon_type2).damage_relations.double_damage_from
  for t in double_damage_from2 do
    double_from2 << t.name
  end

  half_damage_from2 = PokeApi.get(type: pokemon_type2).damage_relations.half_damage_from
  for t in half_damage_from2 do
    half_from2 << t.name
  end
  
  none_damage_from2 = PokeApi.get(type: pokemon_type2).damage_relations.no_damage_from
  for t in none_damage_from2 do
    none_from2 << t.name
  end
  

  render json: {types: pokemon_types, sprite: pokemon_sprite, type1: pokemon_type1, type2: pokemon_type2, double_from1: double_from1, half_from1: half_from1, none_from1: none_from1, double_from2: double_from2, half_from2: half_from2, none_from2: none_from2}
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