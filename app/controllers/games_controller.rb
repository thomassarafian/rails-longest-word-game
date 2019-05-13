require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    @letters = params[:letters]
    @user_letters = params[:score]

    # @authenticity_token = params[:authenticity_token]

    @word = @user_letters
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"

    check_word = open(url).read
    @word = JSON.parse(check_word)

    # if @user_letters.split(//) == @letters && @word["found"] == true
    #   p "1"

    # elsif @user_letters.split(//) == @letters
    #   p "2"

    #  elsif @user_letters.split(//) != @letters
    #    p "3"
    # end

   @toto = @user_letters.split.include? @letters.split.join('')


  end
end

# si user_letters == letters => true && check api => true
#   The word is valid according to the grid and is an English word

# si user_letters == letters => true  && check api => false
#   The word is valid according to the grid and is an English word

# si user_letters != letters => false
#   The word can't be built out of the original grid
