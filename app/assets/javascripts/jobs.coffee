jQuery ->
  $('#jobs').dataTable
    sPaginationType: "full_numbers"
    bServerSide: true
    sAjaxSource: $('#jobs').data('source')
    sDom: "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
    sWrapper: "dataTables_wrapper form-inline"

  # called from a bootstrap dropdown, this closes the dropdown
  $('a[data-toggle=modal]').on 'click', (e) ->
    $('#ajax-modal').removeClass('hide');

  # this sets up the ajax loader, and it will stay until the method specific js removes it
  $('a[data-target=#ajax-modal]').on 'click', (e)->
    e.preventDefault()
    e.stopPropagation();
    $('body').modalmanager('loading');
    $.rails.handleRemote( $(this) );

  #removes whatever is in the modal body content div upon clicking close/outside modal
  $(document).on 'click', '[data-dismiss=modal], .modal-scrollable', ->
    $('.modal-body-content').empty()

  $(document).on 'click', '#ajax-modal', (e) ->
    e.stopPropagation();

  $(document).on 'click', '#start-job', (e) ->
    host_ids = ($(item).data('id') for item in $('.host_checkbox') when $(item).prop("checked"))
    credential_ids = ($(item).data('id') for item in $('.credential_checkbox') when $(item).prop("checked"))
    if host_ids.length > 0 and credential_ids.length > 0
      data = {}
      data['job'] = {}
      data['job']['host_ids'] = host_ids
      data['job']['credential_ids'] = credential_ids
      data['job']['name'] = "Job #{formatDate(new Date())}"
      $.post '/jobs', data
    else
      alert("You don't set any hosts or credentials")

  formatDate = (date) ->
    timeStamp = [date.getFullYear(), (date.getMonth() + 1), date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds() ].join("-")
    RE_findSingleDigits = /\b(\d)\b/g

    # Places a `0` in front of single digit numbers.
    timeStamp = timeStamp.replace( RE_findSingleDigits, "0$1" )
    timeStamp.replace /\s/g, ""
