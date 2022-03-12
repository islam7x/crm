#= require activestorage
#= require turbolinks
#= require jquery3
#= require jquery_ujs
#= require popper
#= require bootstrap-sprockets
#= require_self
#= require cable.js
#= require_tree ./components/base
#= require_tree ./components/parishes

window.CRM = {}

class CRM.Application
  @init: ->
    CRM.ConfirmDialog.init()
    if $('li.dropdown-item').length == 0
      $('li.dropdown').addClass('d-none')

ready = ->
  data = $('body').data()
  page = data.page
  controller = data.controller

  CRM.Application.init()
  CRM[page].init() if CRM[page]?

  controller.split('_').concat('').reduce (sum, part) ->
    CRM[sum].init() if CRM[sum]
    "#{sum}_#{part}"

$(document).on('turbolinks:load', ready)
