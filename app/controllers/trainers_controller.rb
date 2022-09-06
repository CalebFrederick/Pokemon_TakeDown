class TrainersController < ApplicationController
  def create
    trainer = Trainer.new(
      trainer: params[:trainer],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if trainer.save
      render json: { message: "Trainer created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
end
