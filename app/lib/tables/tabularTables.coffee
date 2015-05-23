
@TabularTables = {}

# What does this do?
Meteor.isClient and Template.registerHelper('TabularTables', TabularTables)

TabularTables.TestData = new Tabular.Table
  name: 'TestData'
  collection: TestData
  columns: [
    {
      data: 'title'
      title: 'Title'
    }
    {
      data: 'value'
      title: 'Value'
    }
    {
      data: 'invert'
    }
    {
      data: 'location'
    }
    {
      data: 'comment'
    }
    {
      data: 'switch'
    }
    {
      data: 'select'
    }
    {
      data: 'created'
    }

  ]