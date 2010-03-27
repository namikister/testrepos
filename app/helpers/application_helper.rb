# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include Testrepos::I18n

  # Renders the project quick-jump box
  def render_project_jump_box
    # Retrieve them now to avoid a COUNT query
    testprojects = Testproject.find(:all, :conditions => "id > 0")
    if testprojects.any?
      s = '<select onchange="if (this.value != \'\') { window.location = this.value; }">' +
            "<option value='' selected='selected'>#{ l(:label_jump_to_a_project) }</option>" +
            '<option value="" disabled="disabled">---</option>'
      testprojects.each do |testproject|
        tag_options = { :value => url_for(:controller => 'testprojects', :action => 'show', :id => testproject.id, :jump => current_menu_item)}
        s << content_tag('option', h(testproject.name), tag_options)
      end
      s << '</select>'
      s
    end
  end

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
