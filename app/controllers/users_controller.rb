class UsersController < ApplicationController
skip_before_action :check_session, :only=>[:new,:create,:login,:validate_login]
  def index
    @user=User.all
  end

  def new
    @user=User.new
    @user.build_image
  end

  def create
    @user=User.new(user_params)
    if @user.save
       redirect_to :action=> "index"
    else
       render "new"
    end
  end

  def edit
    @user=User.find params[:id]
    @user.build_image
  end
  
  def update
    @user=User.find params[:id]
    if @user.update_attributes(user_params)
       redirect_to :action=> "index"
    else
       render "edit"
    end
  end

  def login
    @user=User.new
  end

  def validate_login
    params.permit!
    @user=User.where params[:user]
      if not @user.blank?
        session[:user_id]=@user.first.id
        redirect_to:action=>"index"
      else
        redirect_to root_path
      end
  end

  def show
    @user=User.find params[:id]
  end

  def destroy
   @user=User.find params[:id]
   @user.delete
   redirect_to :action=>"index"
  end

  def logout
    session[:user_id]=nil
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit!
  end
end
