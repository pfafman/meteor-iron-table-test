
DEBUG = true

Template.s3Test.onCreated ->
  @uploader = new Slingshot.Upload("imageFiles")


Template.s3Test.onRendered ->
  # ...


Template.s3Test.onDestroyed ->
  # ...


Template.s3Test.helpers
  
  # files: ->
  #   S3.collection.find()

  progress: ->
    Math.round(Template.instance().uploader.progress() * 100)


Template.s3Test.events
  'click button.upload': (event, tmpl) ->
    files = tmpl.$("input.file_bag")[0].files
    console.log("Upload Files", files[0])

    tmpl.uploader.send files[0], (error, downloadUrl) ->
      if (error)
        # Log service detailed response
        console.error('Error uploading', tmpl.uploader) #.xhr.response)
        alert(error)
      else
        console.log("Uploaded file", downloadUrl)
  
    # S3.upload
    #   files: files
    #   path: "test"
    # , (err, rtn) ->
    #   if err
    #     console.log("Upload Error:", err)
    #   else
    #     console.log("Upload rtn:", rtn)

