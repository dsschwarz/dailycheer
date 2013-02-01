class MainController < ApplicationController
  def new
    @memento = Memento.new
  end
  def create
    @memento = Memento.new(body: params[:memento][:body])
    @memento.save
  end
  def show
    if(Memento.last)
   @memento = Memento.find_by_id(rand(Memento.last.id));
  render @memento 
    end
    
  end
end
