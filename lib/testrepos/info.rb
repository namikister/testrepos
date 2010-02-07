module Testrepos
  module Info
    class << self
      def app_name; 'Testrepos' end
      def url; 'http://github.com/namikister' end
      def help_url; 'http://github.com/namikister' end
      def versioned_name; "#{app_name} #{Testrepos::VERSION}" end

      # Creates the url string to a specific Redmine issue
      def issue(issue_id)
        url + 'issues/' + issue_id.to_s
      end
    end
  end
end
