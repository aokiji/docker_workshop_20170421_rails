class FactorialsController < ApplicationController
  def compute
    f = Factorial.find_by(of: params[:id])
    f = factorial_of(params[:id].to_i) if !f

    if f.valid?
      render :json => f
    else
      render :json => {error: 'couldnt save factorial'}
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

  private

  def factorial_of(of)
    n = of
    value = 1
    while n > 0
      value *= n
      n-= 1
    end

    Factorial.create!(of: of, is: value)
  end

end
