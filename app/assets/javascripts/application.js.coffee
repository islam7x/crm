#= require rails-ujs
#= require activestorage
#= require turbolinks
#= require_tree .
#= require jquery3
#= require jquery_ujs
#= require popper
#= require bootstrap-sprockets
#= require_self
#= require cable.js
#= require_tree ./components/base

window.CRM = {}

class CRM.Application
  @init: ->
    CRM.UserModal.init()
    CRM.DisabledLinks.init()
    CRM.GlobalTooltips.init()
    CRM.TurbolinksAdditions.init()
    CRM.ConfirmDialog.init()

ready = ->
  data       = $('body').data()
  page       = data.page
  controller = data.controller

  CRM.Application.init()
  CRM[page].init() if CRM[page]?

  controller.split('_').concat('').reduce (sum, part) ->
    CRM[sum].init() if CRM[sum]
    "#{sum}_#{part}"

$(document).on('turbolinks:load', ready)
