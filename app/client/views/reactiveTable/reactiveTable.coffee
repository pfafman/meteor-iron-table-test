

Template.reactiveTablePage.onCreated ->
  #@table = ReactiveTestTable.getTable
  #  style: "max-height: 300px;"


Template.reactiveTablePage.helpers
  table: ->
    reactiveTestTable.newTable
      showFilter: true
      style: "max-height: 400px;"
      sortColumn : 'value'
      rowLink : (rec) ->
        console.log("Link on #{rec.title}", rec)
      # onDelete: (rec) ->
      #   MaterializeModal.confirm
      #     title: 'Delete Test Record'
      #     message: "Are you sure you want to delete record <i>#{rec.recordName}</i>?"
      #     callback: (yesNo) ->
      #       if yesNo
      #         Meteor.call 'removeTestDataRecord', rec._id, (error, result) ->
      #           if error
      #             Materialize.toast("Error on delete: #{error.reason}", 4000, 'red')
      # onEdit: (rec) ->
      #   console.log("onEdit", rec)
      #   Router.go('home')