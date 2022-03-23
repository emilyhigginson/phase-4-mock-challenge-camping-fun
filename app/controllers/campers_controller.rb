class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

    def index 
        campers = Camper.all
        render json: campers, status: :ok
    end

    def show 
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperActivitiesSerializer,  status: :ok
    end

    def create
        camper = Camper.create(camper_params)
        if camper.valid? 
           render json: camper , status: :created
        else  
            render json: {errors: camper.errors.full_messages}, status: :unprocessable_entity
        end

    end

    private 
     
    def camper_params
        params.permit(:name, :age)
    end
    def handle_not_found(exception)
        render json: {error: "Camper not found"}, status: :not_found
    end
end
