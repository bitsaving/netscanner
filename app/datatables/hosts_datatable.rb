class HostsDatatable
  delegate :params, :h, :link_to, :link_to_logs, :link_to_error, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Host.count,
      iTotalDisplayRecords: hosts.total_entries,
      aaData: data
    }
  end

  private

  def data
    hosts.map do |host|
      [
        host.id,
        host.ipaddress,
        host.hostname,
        host.macaddress,
        host.responsetime,
        host.ports,
        host.logged,
        host.langroup,
        host.os,
        host.tod,
        host.users,
        host.windowsname,
        host.computermodel,
        link_to_logs(host),
        link_to_error(host)
      ]
    end
  end

  def hosts
    @hosts ||= fetch_hosts
  end

  def fetch_hosts
    hosts = Host.page(page).per_page(per_page)
    if params[:sSearch].present?
      hosts = hosts.where("ipaddress like :search", search: "%#{params[:sSearch]}%")
    end
    hosts.order("#{sort_column} #{sort_direction}")
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id ipaddress hostname macaddress responsetime ports logged langroup os tod users windowsname
                 computermodel bruteprogress status]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
