

Meteor.startup ->
  Slingshot.createDirective "imageFiles", Slingshot.S3Storage,

    bucket: "winesail",
    
    acl: "public-read",
    
    region: 'eu-central-1'

    authorize: ->
      # Deny uploads if user is not logged in.
      # if  not this.userId
      #   message = "Please login before posting files"
      #   throw new Meteor.Error("Login Required", message)
      return true

    key: (file) ->
      # Store file into a directory by the user's username.
      #user = Meteor.users.findOne(@userId)
      #user.username + "/" + file.name 
      "images/#{Meteor.uuid()}_#{file.name}"