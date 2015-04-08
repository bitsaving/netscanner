jQuery ->
  $('#credentials').dataTable
    sPaginationType: "full_numbers"
    bServerSide: true
    sAjaxSource: $('#credentials').data('source')
    sDom: "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
    sWrapper: "dataTables_wrapper form-inline"
