# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include Testrepos::I18n

  def page_header_title
    if @testproject.nil? || @testproject.new_record?
      h(Testrepos::Info.app_name)
    else
      h(@testproject.name)
    end
  end

  def html_title(*args)
    if args.empty?
      title = []
      title << @testproject.name if @testproject
      title += @html_title if @html_title
      title << Testrepos::Info.app_name
      title.select {|t| !t.blank? }.join(' - ')
    else
      @html_title ||= []
      @html_title += args
    end
  end

end
