class UsersController < ApplicationController
def new
     @memento = Memento.new(body: "Someone died a few seconds ago - it wasn't you :)")
    if(!Memento.last.nil?)
      timer = 0
     begin
       timer += 1;
       @memento = Memento.find_by_id(rand(Memento.last.id + 1));
     end while @memento.nil? and timer < 10
    end
    if(@memento.nil?)
      @memento = Memento.new(body: "Someone died a few seconds ago - it wasn't you :)")
    end
    if !signed_in?
    	redirect_to '/home'
    end
    @user = User.new
  end

  def reset 
  if !signed_in?
    redirect_to '/home'
  end
  @user = User.find_by_email(params[:email])
end

  def create
     @memento = Memento.new(body: "Someone died a few seconds ago - it wasn't you :)")
    if(!Memento.last.nil?)
      timer = 0
     begin
       timer += 1;
       @memento = Memento.find_by_id(rand(Memento.last.id + 1));
     end while @memento.nil? and timer < 10
    end
    if(@memento.nil?)
      @memento = Memento.new(body: "Someone died a few seconds ago - it wasn't you :)")
    end
    @user = User.new(params[:user])
    if @user.save 
      sign_in @user
     #UserMailer.welcome_email(@user).deliver
      redirect_to "/home"
    else    
      render 'new'
    end
  end

  def page
    if !signed_in?
      @memento = Memento.find_all_by_user_name(current_user.name);
    end

    

