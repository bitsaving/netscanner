class CredentialDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate

  def_delegator :@view, :dom_id
  def_delegator :@view, :check_box_tag

  def sortable_columns
    @sortable_columns ||= [
      'Credential.name',
      'Credential.pass'
    ]
  end

  def searchable_columns
    @searchable_columns ||= [
      'Credential.name',
      'Credential.pass'
    ]
  end

  private

  def data
    records.map do |record|
      [
        check_box_tag(dom_id(record), value = "1", checked = false, data: { id: record.id }, class: 'credential_checkbox'),
        record.user,
        record.pass
      ]
    end
  end

  def get_raw_records
    Credential.all
  end
end
