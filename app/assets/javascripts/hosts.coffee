jQuery ->
  $('#hosts').dataTable
    sPaginationType: "full_numbers"
    bServerSide: true
    sAjaxSource: $('#hosts').data('source')
    sDom: "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
    sWrapper: "dataTables_wrapper form-inline"

  $.extend $.fn.dataTableExt.oStdClasses,
    sWrapper: "dataTables_wrapper form-inline"
