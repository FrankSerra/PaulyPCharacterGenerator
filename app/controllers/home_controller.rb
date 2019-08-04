class HomeController < ApplicationController
  def index
  end

  def generate
=begin
    @entries = Element.all
    send_data @entries.to_xml,
      :type => 'text/xml; charset=UTF-8;',
      :disposition => "attachment; filename=entries.xml"
=end
  end
end
