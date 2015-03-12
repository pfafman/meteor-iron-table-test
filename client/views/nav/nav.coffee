
hideSideNav = ->
  console.log("close menu")
  $('.side-nav').velocity
    left: '-105%'
  ,
    duration: 100
    easing: 'ease-in-out'
    queue: false
    complete: ->
      $('.overlay').hide()
      $('.side-nav').hide()


Template.nav.events
  'click #menu': (e, tmpl) ->
    console.log("open menu")
    $('.side-nav').show()
    $('.side-nav').velocity
      left: 0
    ,
      duration: 200
      easing: 'ease-in-out'
      queue: false
      complete: ->
        $('.overlay').show()

  'click .side-nav a': (e, tmpl) ->
    hideSideNav()

  'click .overlay': (e, tmpl) ->
    hideSideNav()
    