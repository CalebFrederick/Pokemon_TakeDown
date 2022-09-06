class PokemonController < ApplicationController
  before_action :authenticate_user

  def show
    pokemon = Pokemon.find_by(id: params["id"])
    render json: pokemon.as_json
  end

  def index
    pokemon = Pokemon.where(trainer_id: current_user.id)
    #p current_user.id
    render json: pokemon.as_json
  end

  def create
    pokemon = Pokemon.create(
        pokemon_name: params[:pokemon_name],
        trainer_id: params[:trainer_id]
    )

    if pokemon.save
      render json: pokemon
    else 
      render json: { errors: pokemon.errors.full_messages }, status: 406
    end
  end

  def update
    pokemon = Pokemon.find_by(id: params[:id])
    pokemon.pokemon_name = params[:pokemon_name] || pokemon.pokemon_name
    pokemon.save 
    render json: pokemon.as_json

    if pokemon.save
      render json: pokemon
    else 
      render json: { errors: pokemon.errors.full_messages }, status: 406
    end
  end

  def destroy
    pokemon = pokemon.find_by(id:params["id"])
    pokemon.destroy
    render json: {message: "Pokemon removed from party"}
  end
end
