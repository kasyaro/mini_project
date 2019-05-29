class WelcomeController < ApplicationController
    def index
        render json: { status: 200, message: "Coffee API" }
    end
end
