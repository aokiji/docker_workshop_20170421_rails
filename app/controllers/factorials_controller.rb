class FactorialsController < ApplicationController
  def compute
    f = Factorial.find_by(of: params[:id])
    if f
      render :json => f
    else
      FactorialWorker.perform_async(params[:id])
      render :json => {status: 'working on it'}
    end
  end

  def show
    f = Factorial.find_by(of: params[:id])
    if f
      render :json => f
    else
      render :json => {error: 'factorial not computed yet'}
    end
  end

end
