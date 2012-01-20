class ListsController < ApplicationController
  respond_to :html, :json

  def index
    view = ""

    if user_signed_in?
      @lists = current_user.lists
      view   = "lists/user_index"
    else
      @lists = List.where(:visibility => List::Visibility::PUBLIC)
      view   = "lists/index"
    end

    render view
  end

  def show
    @list = List.find(params[:id])
    view  = "lists/show"

    unless @list.visibility == List::Visibility::PUBLIC || (user_signed_in? && current_user.can_view?(@list))
      flash[:alert] = "Sorry, that list is private."
      @list = nil
      view = "lists/permission_denied"
    end

    render view
  end
end
