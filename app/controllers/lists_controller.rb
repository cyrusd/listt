class ListsController < ApplicationController
  respond_to :html, :json

  def index
    if user_signed_in?
      @lists = current_user.lists
    else
      @lists = List.where(:visibility => List::Visibility::PUBLIC)
    end

    respond_with @lists
  end

  def show
    @list = List.find(params[:id])
    respond_with @list
  end
end
