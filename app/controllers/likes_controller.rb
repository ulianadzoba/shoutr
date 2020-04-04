class LikesController < ApplicationController
    before_action :require_login
    
    def create
        current_user.like(shout)
        # respond_to do |format|
        #   format.html { redirect_to root_path }
        #   format.js
        # end
        redirect_to root_path
    end

    def destroy
        current_user.unlike(shout)
        # respond_to do |format|
        #   format.html { redirect_to root_path }
        #   format.js
        # end
        redirect_to root_path            
    end

    private 

    def shout
        @_shout ||= Shout.find(params[:id])
    end
    
end