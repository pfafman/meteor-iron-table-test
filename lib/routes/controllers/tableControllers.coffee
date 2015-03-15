
DO_FAST_RENDER = false

class @TestTableController extends IronTableController
  doNotShowTitle   : true
  tableTitle       : "Test Table"
  subTitle         : "I am a sub title"
  sortColumn       : 'value'
  increment        : 10
  showBackButton   : true
  showNewButton    : true
  #newRecordRoute   : 'addTestData'
  #editRecordRoute  : 'editTestData'
  #formTemplate     : 'testDataForm'
  newRecordTitle   : 'New Record'
  newRecordTooltip : 'Add a new record'
  doDownloadLink   : true
  collection       : -> TestData
  showFilter       : true
  fastRender       : DO_FAST_RENDER
  inabox           : true
  fullScreenOnSmall: true
  extraControlsTemplate: "testLink"
  showJSON         : true
  templateClasses  :
    container: ''
    box: 'z-depth-1'
    table: 'centered hoverable bordered' # 'striped'

  #newRecordCallback :  (rec) ->
  #   console.log("New Record Callback", rec)



  #yieldTemplates:
  #  'beforeTest':
  #    to: 'beforeMain'
  #    data: ->
  #      comment: 'test'

  action: ->
    #console.log('action')
    @render()

    @render 'beforeTest',
      to: 'beforeMain'
      data: ->
        #console.log("beforeTest data")
        comment: 'test'

  onRun: ->
    super
    console.log('TestTableController onRun')
    Session.set("testDataValue", 100)

  #data: ->
  #  console.log("TestTable data")
  #  super
  onAfterAction: ->
    #console.log("Can we get at the Template?", @)


  # Override the removeRecord Function
  removeRecord: (rec) =>
    console.log("Remove Test Data Record", rec._id, @isSimulation)
    name = rec.recordDisplayName
    Meteor.call 'removeTestDataRecord', {_id: rec._id}, (error) ->
      if error
        console.log("Error deleting #{name}", error)
        CoffeeAlerts.error("Error deleting #{name}: #{error.reason}")
      else
        CoffeeAlerts.success("Deleted #{name}")
    @fetchRecordCount()


