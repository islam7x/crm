class CRM.ParishesIndex
  @init: ->
    @bind()

  @bind: ->
    $('#search_parish').on 'click', redirectTo

  redirectTo = ->
    value = $('#parish').val()
    window.location.href = "/parishes/#{value}/expenses";

class CRM.ExpensesIndex extends CRM.ParishesIndex
