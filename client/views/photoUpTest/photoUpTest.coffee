
Template.photoUpTest.helpers
  photoUpOptions: ->
    showInfo: false
    loadImage:
      maxWidth: 300
      maxHeight: 300
    crop: false # not working
    jCrop: {}
    callback: (error, photo) ->
      if error
        toast(error.reason, 3000, 'red')
      else
        console.log("New Photo Callback", photo)
        toast("Have photo to save", 3000)
        