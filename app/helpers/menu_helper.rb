module MenuHelper
  include Testrepos::I18n

  MENUS = [{:name => "specification", :url => {:controller => 'testprojects', :action => "index"}},
           {:name => "testplan",      :url => {:controller => 'testprojects', :action => "index"}},
           {:name => "result",        :url => {:controller => 'testprojects', :action => "index"}},
          ]
  def render_main_menu(selected)
    logger.warn("render_main_menu")
    links = []
    MENUS.each do |item|
      label = item[:label] || 'label_' + item[:name]
      config = {}
      if item[:name] == selected
        config[:class] = 'selected'
      end
      links << content_tag('li', link_to(l(label), item[:url], config))
    end
    links.empty? ? nil : content_tag('ul', links.join("\n"))
  end
end
