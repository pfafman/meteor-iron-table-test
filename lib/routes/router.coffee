Router.configure
  layoutTemplate: 'layout'
  

Router.route '/',
  name: 'home'
  template: 'home'


Router.route '/ironTable',
  controller: TestTableController


Router.route '/tabularTable'


Router.route '/modalTest'


Router.route '/photoUpTest'


Router.route '/s3Test'


Router.route '/reactiveTable',
  template: 'reactiveTablePage'
