class ResourcesController < ApplicationController

    def create 
        resource = Resource.new(content: params[:content], link: params[:link])

        if resource.save 
            render json: resource, status: :created
        else 
            render json: {errors: resource.errors}, status: :unprocessable_entity
        end
    end

    def index 
        resources = Resource.all 

        render json: resources, status: :ok
    end

    def show 
        resource = Resource.find(params[:id])

        render json: resource, status: :ok
    end

    def update 
        resource = Resource.find(params[:id])

        if resource.update(content: params[:content], link: params[:link])
            render json: resource, status: :ok
        else 
            render json: {errors: resource.errors}, status: :unprocessable_entity
        end
    end

    def destroy 
        resource = Resource.find(params[:id])

        resource.destroy 
        
        render json: {message: "resource deleted"}, status: :ok
    end
end