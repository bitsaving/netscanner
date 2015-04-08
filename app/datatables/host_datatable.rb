class HostDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate

  def_delegator :@view, :dom_id
  def_delegator :@view, :check_box_tag
  def_delegator :@view, :link_to_logs
  def_delegator :@view, :link_to_error

  def sortable_columns
    @sortable_columns ||= [
      'hosts.ipaddress',
      'Host.hostname',
      'Host.macaddress',
      'Host.responsetime',
      'Host.ports',
      'Host.logged',
      'Host.langroup',
      'Host.os',
      'Host.tod',
      'Host.users',
      'Host.windowsname',
      'Host.computermodel',
      'Host.status'
    ]
  end

  def searchable_columns
    @searchable_columns ||= [
      'hosts.ipaddress',
      'Host.hostname',
      'Host.macaddress',
      'Host.responsetime',
      'Host.ports',
      'Host.logged',
      'Host.langroup',
      'Host.os',
      'Host.tod',
      'Host.users',
      'Host.windowsname',
      'Host.computermodel',
    ]
  end

  private

  def data
    records.map do |record|
      [
        check_box_tag(dom_id(record), value = "1", checked = false, data: { id: record.id }, class: 'host_checkbox'),
        record.ipaddress,
        record.hostname,
        record.macaddress,
        record.responsetime,
        record.ports,
        record.logged,
        record.langroup,
        record.os,
        record.tod,
        record.users,
        record.windowsname,
        record.computermodel,
        link_to_logs(record),
        link_to_error(record)
      ]
    end
  end

  def get_raw_records
    Host.all
  end
end
