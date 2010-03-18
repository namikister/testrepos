# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Testrepos::I18n
  include Testrepos::MenuManager::MenuController
  helper  Testrepos::MenuManager::MenuHelper

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  before_filter :set_localization

  protected

  def set_localization
    lang = nil
    if lang.nil? && request.env['HTTP_ACCEPT_LANGUAGE']
      accept_lang = parse_qvalues(request.env['HTTP_ACCEPT_LANGUAGE']).first.downcase
      if !accept_lang.blank?
        lang = find_language(accept_lang) || find_language(accept_lang.split('-').first)
      end
    end
    lang ||= 'en'
    set_language_if_valid(lang)
  end
  # qvalues http header parser
  # code taken from webrick

  def parse_qvalues(value)
    tmp = []
    if value
      parts = value.split(/,\s*/)
      parts.each {|part|
        if m = %r{^([^\s,]+?)(?:;\s*q=(\d+(?:\.\d+)?))?$}.match(part)
          val = m[1]
          q = (m[2] or 1).to_f
          tmp.push([val, q])
        end
      }
      tmp = tmp.sort_by{|val, q| -q}
      tmp.collect!{|val, q| val}
    end
    return tmp
  rescue
    nil
  end
end
