module Jesus
  module Helpers
    def class_if_current(link)
      link = '^/$' if link == '/'
      'class="current"' if request.path_info =~ Regexp.new(link)
    end
    def tab(name, link)
      "<li #{class_if_current(link)}><a href='#{link}'>#{name}</a></li>"
    end
    
    def flash_tag(type)
      "<div id='flash'>#{session.delete(type)}</div>" unless session[type].nil?
    end
    def flash(type, message)
      session[type] = message
    end
    def confirm(message='Are you sure you want to do this ?')
      return "javascript:return confirm('" + message + "');"
    end
    
    
    def show(page, layout = true)
      erb page.to_sym, {:layout => layout}
    end
    
    def process_action(process)
      case process[1][:state]
        when :up
          return '<li><a href="/command/stop/' + process[0] + '" onclick="' + confirm + '">Stop Process</a></li>' +
                  '<li><a href="/command/restart/' + process[0] + '" onclick="' + confirm + '">Restart Process</a></li>'
      when :unmonitored
          return '<li><a href="/command/start/' + process[0] + '">Start Process</a></li>'
      end
    end
  end
end