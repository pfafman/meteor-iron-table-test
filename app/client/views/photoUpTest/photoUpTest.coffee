
Template.photoUpTest.helpers
  photoUpOptions: ->
    showInfo: true
    showClear: true
    photoClass: "z-depth-3"
    minDisplayWidth: 480
    minDisplayHeight: 300
    #maxDisplayWidth: 400
    #maxDisplayHeight: 300
    desiredWidth: 480
    desiredHeight: 300
    requiredAspectRatio: 1.6
    loadImage:
      #canvas: true
      #crop: true
      cover: true
      maxWidth: 480
      maxHeight: 300
      #aspectRatio: 1.6
    
    #autoSelectOnJcrop: true
    crop: true
    jCrop:
      aspectRatio: 1.6
      #maxSize: [480, 300]
      #boxWidth: 480
    callback: (error, photo) ->
      if error
        Materialize.toast(error.reason, 3000, 'red')
      else
        console.log("New Photo Callback", photo)
        Materialize.toast("Have photo to save", 3000)
    