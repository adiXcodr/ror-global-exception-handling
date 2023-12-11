class PublicController < ApplicationController
  include NumberHelper
  def generate_random_number
    render json: { number: randomized_number }
  end

  def generate_random_number_with_exception
    render json: { number: randomized_number_with_exception }
  end
end
