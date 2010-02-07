module Yui4Rails
  module IncludeExtension
    def add_datatable_includes
      @yui_stylesheets << "datatable/assets/skins/sam/datatable"
      @yui_javascript << "utilities/utilities"
      @yui_javascript << "datasource/datasource-min"
      @yui_javascript << "datatable/datatable-min"
    end

    def add_charts_includes
      @yui_javascript << "utilities/utilities"
      @yui_javascript << "datasource/datasource-min"
      @yui_javascript << "json/json-min"
      @yui_javascript << "charts/charts-experimental-min"
      @yui_script << %{YAHOO.widget.Chart.SWFURL = "/yui/charts/assets/charts.swf";}
    end

    def add_container_includes
      @yui_stylesheets << "container/assets/container"
      @yui_javascript << "yahoo-dom-event/yahoo-dom-event"
      @yui_javascript << "animation/animation-min"
      @yui_javascript << "container/container-min"
    end

    def add_treeview_includes
      @yui_stylesheets << "treeview/assets/skins/sam/treeview"
      @yui_stylesheets << "treeview/assets/treeview-menu"
      @yui_stylesheets << "logger/assets/skins/sam/logger"
      @yui_stylesheets << "button/assets/skins/sam/button"
      @yui_javascript  << "yuiloader/yuiloader-min"
      @yui_javascript  << "event/event-min"
      @yui_javascript  << "dom/dom-min"
      @yui_javascript  << "logger/logger-min"
      @yui_javascript  << "treeview/treeview-debug"
      @yui_javascript  << "element/element-min"
      @yui_javascript  << "button/button-min"
    end

    def include_yui(*args)
      options = args.last.is_a?(Hash) ? args.pop : {} 
      @yui_stylesheets = []
      @yui_javascript = []
      @yui_script = []
      yui_includes = []

      add_container_includes if args.include?(:container)
      add_datatable_includes if args.include?(:datatable)
      add_charts_includes    if args.include?(:charts)
      add_treeview_includes  if args.include?(:treeview)


      yui_includes << @yui_stylesheets.uniq.map{|ss| stylesheet_link_tag("/yui/#{ss}")}
      yui_includes << @yui_javascript.uniq.map{|js| javascript_include_tag("/yui/#{js}")}

      unless @yui_script.empty?
        yui_includes << "<SCRIPT>"
        yui_includes << @yui_script
        yui_includes << "</SCRIPT>"
      end
      yui_includes.flatten.join("\n")
    end
  end
end
