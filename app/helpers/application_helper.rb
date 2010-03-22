# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include Testrepos::I18n

  def html_title(*args)
    if args.empty?
      title = []
      title << @project.name if @project
      title += @html_title if @html_title
      title << Setting.app_title
      title.select {|t| !t.blank? }.join(' - ')
    else
      @html_title ||= []
      @html_title += args
    end
  end

end
