class LeasesController < ApplicationController

    def create
        lease = Lease.create(lease_params)
        if lease.valid?
            render json: lease, status: :created
        else
            unprocessable_entity
        end
    end

    def destroy
        lease = Lease.find_by(id: params[:id])
        if lease
            lease.destroy
            head :no_content
        else
            not_found
        end
    end

    private

    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end

    def not_found
        render json: {error: "lease not found"}, status: :not_found
    end

    def unprocessable_entity(invalid)
        render json: {error: invalid.errors}, status: :unprocessable_entity
    end
end
