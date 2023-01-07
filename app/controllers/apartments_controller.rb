class ApartmentsController < ApplicationController

    def index
        apartment = Apartment.all
        render json: apartment, status: :ok
    end

    def show
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            render json: apartment, status: :ok
        else
            not_found
        end
    end

    def create
        apartment = Apartment.create(apartment_params)
        if apartment.valid?
            render json: apartment, status: :created
        else
            unprocessable_entity(apartment)
        end
    end

    def update
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            apartment.update(apartment_params)
            render json: apartment, status: :ok
        else
            not_found
        end
    end

    def destroy
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            apartment.destroy
            head :no_content
        else
            not_found  
        end
    end

    private

    def apartment_params
        params.permit(:number)
    end

    def not_found
        render json: {error: "apartment not found"}, status: :not_found
    end

    def unprocessable_entity(invalid)
        render json: {error: invalid.errors}, status: :unprocessable_entity
    end
end
