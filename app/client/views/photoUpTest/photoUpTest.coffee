

DEBUG = true

image = new ReactiveVar()


DataURItoBlob = (dataURI, type="image/png") ->
  binary = atob(dataURI.split(',')[1])
  array = []
  i = 0
  while i < binary.length
    array.push binary.charCodeAt(i)
    i++
  new Blob([ new Uint8Array(array) ], type: type)


Template.photoUpTest.onCreated ->
  image.set(null)
  @uploader = new Slingshot.Upload("imageFiles")


Template.photoUpTest.events
  'click #save': (event, tmpl) ->
    imgFile = DataURItoBlob(image.get().src, image.get().type)
    imgFile.name = image.get().name
    console.log("save", image.get(), imgFile)

    tmpl.uploader.send imgFile, (error, downloadUrl) ->
      if (error)
        # Log service detailed response
        console.error('Error uploading', tmpl.uploader) #.xhr.response)
        alert(error)
      else
        console.log("Uploaded file", downloadUrl)
    

Template.photoUpTest.helpers
  haveImage: ->
    image.get()?

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
        image.set(photo)

    