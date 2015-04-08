class JobDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate

  def_delegator :@view, :link_to
  def_delegator :@view, :job_path

  def sortable_columns
    @sortable_columns ||= [
      'Job.name',
      'Job.description',
      'Job.status',
      'Job.error_message'
    ]
  end

  def searchable_columns
    @searchable_columns ||= [
      'Job.name',
      'Job.description',
      'Job.status',
      'Job.error_message'
    ]
  end

  private

  def data
    records.map do |record|
      [
        link_to(record.id, job_path(record)),
        record.name,
        record.description,
        record.status
      ]
    end
  end

  def get_raw_records
    Job.all
  end
end
