module Api  
  class UsersController < Api::BaseController


   def index
    @users = User.all
     respond_to :json
  end

    private

      def user_params
        params.require(:user).permit!
      end

      def query_params
        # this assumes that an album belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit!
      end

  end
end  
