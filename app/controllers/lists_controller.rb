class ListsController < ApplicationController
  respond_to :html, :json

  def index
    if user_signed_in?
      @lists = current_user.lists.order("updated_at DESC")
    else
      @lists = List.where(:visibility => [List::Visibility::PUBLIC, List::Visibility::PROTECTED]).order("updated_at DESC")
    end

    respond_with @lists
  end

  def show
    @list = List.find(params[:id])
    respond_with @list
  end
end
