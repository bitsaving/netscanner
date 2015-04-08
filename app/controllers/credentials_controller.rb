class CredentialsController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.slim
      format.json { render json: CredentialDatatable.new(view_context) }
    end
  end
end
