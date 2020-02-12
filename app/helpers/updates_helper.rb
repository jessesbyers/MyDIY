module UpdatesHelper

    def view_latest_update
        if @goal.updates.any?
            content_tag(:h6, "#{@goal.updates.last.user.username} -  #{@goal.updates.last.human_readable_date} - #{@goal.updates.last.content}")
        end
    end

end