class CRM.Parishes
  @init: ->
    @bind()

  @bind: ->
    $('#search_parish').on 'click', @redirect

  @redirect: ->
    value = $('#parish').val()
    window.location.href = "/parishes/#{value}/expenses";