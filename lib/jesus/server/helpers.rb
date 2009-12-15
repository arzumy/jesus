module Jesus
  module Helpers
    #
    # Is this menu link the current page ?
    #
    def class_if_current(link)
      link = '^/$' if link == '/'
      'class="current"' if request.path_info =~ Regexp.new(link)
    end
    #
    # The menu link li
    #
    def tab(name, link)
      "<li #{class_if_current(link)}><a href='#{link}'>#{name}</a></li>"
    end
    
    #
    # The flash message tag
    #
    def flash_tag(type)
      "<div id='flash'>#{session.delete(type)}</div>" unless session[type].nil?
    end
    #
    # Defines a flash message
    #
    def flash(type, message)
      session[type] = message
    end
    #
    # A confirmation, to be included in a link
    #
    def confirm(message='Are you sure you want to do this ?')
      return "javascript:return confirm('" + message + "');"
    end
    
    #
    # Displays an erb page
    #
    def show(page, layout = true)
      erb page.to_sym, {:layout => layout}
    end
    
    #
    # Displays the actions links for a process
    #
    def process_action(process)
      case process[1][:state]
        when :up
          return '<li><a href="/command/stop/' + process[0] + '" onclick="' + confirm + '"><img src="/img/stop.png" alt="Stop Process" /></a></li>' +
                  '<li><a href="/command/restart/' + process[0] + '" onclick="' + confirm + '"><img src="/img/restart.png" alt="Restart Process" /></a></li>'
      when :unmonitored
          return '<li><a href="/command/start/' + process[0] + '"><img src="/img/start.png" alt="Start Process" /></a></li>'
      end
    end
  end
end