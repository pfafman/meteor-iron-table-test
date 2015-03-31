

Template.reactiveTablePage.onCreated ->
  #@table = ReactiveTestTable.getTable
  #  style: "max-height: 300px;"


Template.reactiveTablePage.helpers
  table: ->
    ReactiveTestTable.getTable
      #style: "max-height: 300px;"
      sortColumn : 'value'


