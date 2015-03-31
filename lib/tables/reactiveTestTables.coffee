# This needs to be here to set up the server side stuff
class ReactiveTestTable extends ReactiveTable
  collection: TestData
  #schema:  TestData.schema
  recordName: 'Test Record'
  colToUseForName : 'title'
  sortColumn      : 'value'
  methodOnInsert  : 'insertTestDataRecord'
  methodOnUpdate  : 'updateTestDataRecord'
  methodOnRemove  : 'removeTestDataRecord'
  doRowLink : true


  downloadFields:
    'title': 1
    'value': 1
    'invert': 1
    'comment': 1
    'created': 1
    'random': 1
    'last_update': 1
    'location.coordinates.0': 1
    'location.coordinates.1': 1
  
  schema:
    'title':
      placeholder: 'enter a name ...'
      required: true
      edit: true
      #contenteditable: true
      insert: true
      autofocus: true
      staticOn_edit: true
      tooltip: 'Enter whatever you like'
      canFilterOn: true
      helpText: 'Just a title'
    'value':
      dataKey: 'value'
      edit: false
      #contenteditable: true
      class: 'center-align'
      insert: false
      type: 'number'
      canFilterOn: true
      onInsert: ->
        throw new Meteor.Error(401, 'Test Throw') unless Session.get("testDataValue")?
        Session.get("testDataValue")
    'invert':
      edit: false
      insert: false
      class: 'center-align'
      #contenteditable: true
      type: 'number'
      canFilterOn: true
    'location':
      noSort: true
      target: '_blank'
      class: 'center-align'
      link: (col, rec) ->
        if rec.location?.coordinates?[0]? and rec.location?.coordinates?[1]?
          "https://maps.google.com/maps?q=#{rec.location.coordinates[0]},#{rec.location.coordinates[1]}&num=1&vpsrc=0&ie=UTF8&t=m&z=13&iwloc=A"
      display: (col, rec) ->
        if rec.location?.coordinates?[0]? and rec.location?.coordinates?[1]?
          lat = rec.location.coordinates[0].toFixed(3)
          lng = rec.location.coordinates[1].toFixed(3)
          "(#{lat}, #{lng})"
    'comment':
      edit: true
      insert: true
      #contenteditable: true
      class: "hidden-xs"
      type: 'textarea'
      canFilterOn: true
      helpText: "Do you need some help?"
    'switch':
      edit: true
      #contenteditable: true
      insert: false
      canFilterOn: true
      type: 'boolean'
      #checkedMark: 'fa-check-circle'
      #blankOnNotChecked: true
      #template: 'checkMark'  # Use the canned one
    'select':
      edit: true
      class: 'center-align'
      #contenteditable: true
      placeholder: "Select an option"
      insert: true
      type: 'select'
      select: [
        'zero'
        'one'
        'two'
        'three'
      ]
    'created':
      edit: false
      insert: false
      onInsert: ->
        new Date()
      valueFunc: Format.DateTime
      class: 'visible-lg'
    'last_update':
      header: "updated"
      edit: false
      insert: false
      onUpdate: ->
        new Date()
      onInsert: ->
        new Date()
      valueFunc: Format.DateTime

  insertOk: (record)->
    true

  deleteAllOk: ->
    false

  deleteOk: (record) ->
    true

  editOk: (record) ->
    true


@reactiveTestTable = new ReactiveTestTable()

