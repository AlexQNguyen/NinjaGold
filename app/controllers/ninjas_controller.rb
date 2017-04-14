class NinjasController < ApplicationController
  def index
    if !session[:count]
    session[:count] = 0
    session[:activity] =[]
    end

    @gold = session[:count]
    @activity = session[:activity]


  end

  def farm
    current_time = Time.now
    amount = rand(10..20)
    session[:count] += amount
    obj = {won: true, sentence: "You won #{amount} from the farm! (#{current_time.strftime('%Y/%m/%d %l:%M %P')})"}
    session[:activity].push(obj)
    redirect_to '/'
  end

  def cave
    current_time = Time.now
    amount = rand(5..10)
    session[:count] += amount
    obj = {won: true, sentence: "You won #{amount} from the Cave! (#{current_time.strftime('%Y/%m/%d %l:%M %P')})"}
    session[:activity].push(obj)
    redirect_to '/'
  end

  def house
    current_time = Time.now
    amount = rand(2..5)
    session[:count] += amount
    obj = {won: true, sentence: "You won #{amount} from the House! (#{current_time.strftime('%Y/%m/%d %l:%M %P')})"}
    session[:activity].push(obj)
    redirect_to '/'
  end

  def casino
    current_time = Time.now
    amount = rand(0..50)
    gamble = rand(1..2)
  if gamble == 1
    session[:count] += amount
    obj = {won: true, sentence: "You won #{amount} from the Casino! (#{current_time.strftime('%Y/%m/%d %l:%M %P')})"}
    session[:activity].push(obj)
  else
    session[:count] -=amount
    obj = {won: false, sentence: "You lost #{amount} from the Casino! (#{current_time.strftime('%Y/%m/%d %l:%M %P')})"}
    session[:activity].push(obj)
  end
    redirect_to '/'
  end


end
