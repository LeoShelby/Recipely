# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

autocomplete = ->
  bank_code = undefined

  $("#ingredient").autocomplete
    source: (request, response) ->
      $.ajax
        url: "https://api.nal.usda.gov/ndb/nutrients/?format=json&api_key=DEMO_KEY&nutrients=205&nutrients=204&nutrients=208&nutrients=269"
        dataType: "json"
        data: name: request.term
        success: (data) ->
          response $.map(data, (item) ->
            {
              label: item.name
              code: item.code
            }
          )
    minLength: 1
    select: (event, ui) ->
      bank_code = ui.item.code

 
