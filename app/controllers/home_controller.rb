class HomeController < ApplicationController
  def index
  end

  def generate
    count = 1
    if params[:count]
      count = params[:count]
    end

    @entries = ''
    count.times do
      @entries += Character.new.output
    end

    send_data @entries,
      :type => 'text; charset=UTF-8;',
      :disposition => 'inline'
      #:disposition => "attachment; filename=entries.xml"
  end
end
