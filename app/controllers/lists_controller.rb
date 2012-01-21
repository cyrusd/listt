class ListsController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!, :only => [:new, :create, :destroy]

  rescue_from Exceptions::AccessDenied do
    flash[:alert] = "Sorry, that list is not available."
    render :permission_denied, :status => 404
  end

  def index
    @lists = []

    if user_signed_in?
      @lists = current_user.lists.order("updated_at DESC")
    else
      @lists = List.where(:visibility => [List::Visibility::PUBLIC, List::Visibility::PROTECTED]).order("updated_at DESC")
    end

    respond_with @lists
  end

  def new
  end

  def create
  end

  def destroy
    @list = List.find(params[:id])

    unless @list.editable_by?(current_user)
      raise Exceptions::AccessDenied
    end

    @list.destroy

    redirect_to lists_path
  end

  def show
    @list = List.find(params[:id])

    unless @list.viewable_by?(current_user)
      raise Exceptions::AccessDenied
    end

    respond_with @list
  end
end
