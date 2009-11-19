module Jesus
  module Helpers
    def class_if_current(link)
      'class="current"' if link =~ Regexp.new(request.path_info)
    end
    def tab(name, link)
      "<li #{class_if_current(link)}><a href='#{link}'>#{name}</a></li>"
    end
  end
end