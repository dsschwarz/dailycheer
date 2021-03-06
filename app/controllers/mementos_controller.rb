class MementosController < ApplicationController
  before_filter :session_exists
  def new
    @memento = Memento.new
  end
  def create

    @memento = Memento.new(params[:memento])
    if @memento.body == ""
      flash[:notice] = "Error: There was no content in your note" 
      redirect_to add_path
    else
    @memento.user_name = current_user.name
    @memento.save
    redirect_to '/'
  end
end
  def show
    @memento = Memento.new(body: "Someone died a few seconds ago - it wasn't you :)")
    if(!Memento.last.nil?)
      timer = 0
     begin
       timer += 1;
       memento_array = []
       memento_array = Memento.find_all_by_user_name(current_user.name);
       size = memento_array.length
       randnum = 1;
       randnum = rand(size)

       @memento = memento_array[randnum]

     end while @memento.nil? and timer < 10
    end
    if(@memento.nil?)
      @memento = Memento.new(body: "Someone died a few seconds ago - it wasn't you :)")
    end
  end
end