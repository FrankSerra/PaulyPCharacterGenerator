class HomeController < ApplicationController
  def index
  end

  def generate
    count = 1
    if params[:count]
      count = params[:count]
    end

    @characters = []

    count.to_i.times do
      @characters.append(Character.new)
    end

    respond_to do |format|
      format.html { render "generate", characters: @characters }
      format.text  { gen_char_txt }
    end
  end

  def gen_char_txt
    entries = ''
    @characters.each do |c|
      entries += (c.output + "\n")
    end

    send_data entries,
      :type => 'text; charset=UTF-8;',
      :disposition => 'inline'
  end
end
