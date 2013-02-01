class MementosController < ApplicationController
  def new
    @memento = Memento.new
  end
  def create
    @memento = Memento.new(params[:memento])
    @memento.save
    redirect_to '/'
  end
  def show
    @memento = Memento.new(body: "Someone died a few seconds ago - it wasn't you :)")
    if(!Memento.last.nil?)
      timer = 0
     begin
       timer++
       @memento = Memento.find_by_id(rand(Memento.last.id));
     end while @memento.nil? and timer < 10
    end
    if(@memento.nil?)
      @memento = Memento.new(body: "Someone died a few seconds ago - it wasn't you :)")
    end
    
  end
end
