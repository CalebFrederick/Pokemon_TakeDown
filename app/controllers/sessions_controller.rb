class SessionsController < ApplicationController

  def create
    p "trying to create session"
    trainer = Trainer.find_by(email: params[:email])
    if trainer && trainer.authenticate(params[:password])
      jwt = JWT.encode(
        {
          trainer_id: trainer.id, # the data to encode
          exp: 24.hours.from_now.to_i, # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )
      p "authorized path"
      render json: { jwt: jwt, email: trainer.email, trainer_id: trainer.id }, status: :created
    else
      p "unauthorized path"
      render json: {}, status: :unauthorized
    end
  end

end
