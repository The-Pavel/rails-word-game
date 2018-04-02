class GamesController < ApplicationController
  def new
    @letters = ("A".."Z").to_a.sample(10);
  end

  def word_check(word)
    @a = params["letters"].downcase.split(' ')
    @word = word.split('')
    @match = @word.all? { |letter| @a.include?(letter) }
    return @match
  end

  def score
    file = Net::HTTP.get_response(URI.parse("https://wagon-dictionary.herokuapp.com/#{params[:answer]}"))
    @hsh = JSON.parse(file.body)
    if @hsh["found"] && word_check(params[:answer])
      if session[:total] == nil
        session[:total] = 0
      else
        session[:total] += @hsh["length"]
      end
      @result = "Congrats!"
      @score = "Your guess #{params[:answer]} got your a score of #{@hsh["length"]}. Total Now is #{session[:total]}"
    elsif @hsh["found"] == true
      @result = "You are using the wrong letters"
    else
      @result = "Not an english word"
    end

  end

end
