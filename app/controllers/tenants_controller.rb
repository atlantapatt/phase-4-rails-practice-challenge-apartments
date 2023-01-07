class TenantsController < ApplicationController

    def index
        tenant = Tenant.all
        render json: tenant, status: :ok
    end

    def show
        tenant = Tenant.find_by(id: params[:id])
        if tenant
            render json: tenant, status: :ok
        else
            not_found
        end
    end

    def create
        tenant = Tenant.create(tenants_params)
        if tenant.valid?
            render json: tenant, status: :created
        else
            unprocessable_entity(tenant)
        end
    end

    def update
        tenant = Tenant.find_by(id: params[:id])
        if tenant
            tenant.update(tenants_params)
            render json: tenant, status: :ok
        else
            unprocessable_entity
        end
    end

    def destroy
        tenant = Tenant.find_by(id: params[:id])
        if tenant
            tenant.destroy
            head :no_content
        else
            not_found
        end
    end

    private

    def tenants_params
        params.permit(:name, :age)
    end

    def not_found
        render json: {error: "tenant not found"}, status: :not_found
    end

    def unprocessable_entity(invalid)
        render json: {error: invalid.errors}, status: :unprocessable_entity
    end
end
