class SignupsController < ApplicationController
     rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

   def create 
      signup = Signup.create(signup_params)
      if signup.valid?
          render json: signup.activity, status: :created
      else 
          render json: {errors: signup.errors.full_messages}, status: :unprocessable_entity
      end
    
  end

   private 
   def signup_params
      params.permit(:camper_id, :activity_id, :time)
   end

   def handle_invalid_record(exception)
       render json: {errors: exception.message}, status: :unprocessable_entity
     end 
end
