module HostsHelper
  def link_to_error(host)
    case host.status
    when 'error'
      link_to host.status, '#'
    else
      host.status
    end
  end

  def link_to_logs(host)
    if host.bruteprogress.present? && !host.bruteprogress == '0/0'
      link_to host.bruteprogress, '#'
    else
      host.bruteprogress
    end
  end
end
