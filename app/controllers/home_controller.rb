class HomeController < ApplicationController
  def index
  end

  def generate
    @entries = Character.new.output
    send_data @entries,
      :type => 'text; charset=UTF-8;',
      :disposition => 'inline'
      #:disposition => "attachment; filename=entries.xml"
  end
end
