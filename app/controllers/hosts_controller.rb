class HostsController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.slim
      format.json { render json: HostDatatable.new(view_context) }
    end
  end
end
