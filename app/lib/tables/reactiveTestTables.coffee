# This needs to be here to set up the server side stuff
class ReactiveTestTable extends ReactiveTable
  collection: TestData
  recordName: 'Test Record'
  colToUseForName : 'title'
  sortColumn      : 'value'
  methodOnInsert  : 'insertTestDataRecord'
  methodOnUpdate  : 'updateTestDataRecord'
  methodOnRemove  : 'removeTestDataRecord'
  doRowLink       : true
  #newRecordRoute  : 'nowhere'
  showNewButton   : true
  doDownloadLink  : true # Not working ?!?!


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
      update: true
      #contenteditable: true
      insert: true
      autofocus: true
      staticOn_update: true
      tooltip: 'Enter whatever you like'
      canFilterOn: true
      helpText: 'Just a title'
    'value':
      dataKey: 'value'
      update: true
      #contenteditable: true
      class: 'center-align'
      insert: true
      type: 'number'
      canFilterOn: true
      # onInsert: ->
      #   throw new Meteor.Error(401, 'Test Throw') unless Session.get("testDataValue")?
      #   Session.get("testDataValue")
    'invert':
      update: false
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
      update: true
      insert: true
      #contenteditable: true
      class: "hidden-xs"
      type: 'textarea'
      canFilterOn: true
      helpText: "Do you need some help?"
    'switch':
      update: true
      #contenteditable: true
      insert: true
      canFilterOn: true
      type: 'boolean'
      #checkedMark: 'fa-check-circle'
      #blankOnNotChecked: true
      #template: 'checkMark'  # Use the canned one
    'select':
      update: true
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
      update: false
      insert: false
      onInsert: ->
        new Date()
      valueFunc: Format.DateTime
      class: 'visible-lg'
    'last_update':
      header: "updated"
      update: false
      insert: false
      onUpdate: ->
        new Date()
      onInsert: ->
        new Date()
      valueFunc: Format.DateTime

  insertOk: (record)->
    true

  updateOk: (record) ->
    true

  removeAllOk: ->
    false

  removeOk: (record) ->
    true


@reactiveTestTable = new ReactiveTestTable()

