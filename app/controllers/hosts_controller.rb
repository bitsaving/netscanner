class HostsController < ApplicationController
  def index
    @hosts = Host.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.slim
      format.json { render json: HostsDatatable.new(view_context) }
    end
  end
end
