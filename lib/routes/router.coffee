Router.configure
  layoutTemplate: 'layout'
  

Router.route '/',
  template: 'home'


Router.route '/ironTable',
  controller: TestTableController


Router.route '/tabularTable'


Router.route '/modalTest'


Router.route '/photoUpTest'


Router.route '/reactiveTable',
  template: 'reactiveTablePage'
