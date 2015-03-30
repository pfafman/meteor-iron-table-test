
Template.photoUpTest.helpers
  photoUpOptions: ->
    showInfo: true
    showClear: true
    minDisplayWidth: 300
    minDisplayHeight: 300
    loadImage:
      maxWidth: 500
      maxHeight: 500
    crop: true
    jCrop:
      aspectRatio: 1
    callback: (error, photo) ->
      if error
        toast(error.reason, 3000, 'red')
      else
        console.log("New Photo Callback", photo)
        toast("Have photo to save", 3000)
        