class HomeController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :invoices
  
  def invoices
    render json: { foo: 2 } 
  end
end
