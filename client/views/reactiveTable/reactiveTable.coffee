

Template.reactiveTablePage.onCreated ->
  @table = ReactiveTestTable


Template.reactiveTablePage.helpers
  table: ->
    Template.instance().table

