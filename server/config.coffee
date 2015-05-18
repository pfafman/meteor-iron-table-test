

# Winesail access keys

# S3.config =
#   key: 'AKIAJ33C3Q6RFI4FRHCA',
#   secret: '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',
#   bucket: 'winesail-images'
#   region:  'eu-central-1'

Meteor.settings =
  AWSAccessKeyId: 'AKIAJ33C3Q6RFI4FRHCA'
  AWSSecretAccessKey: '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'


Meteor.startup ->
  Slingshot.createDirective "imageFiles", Slingshot.S3Storage,
    AWSAccessKeyId: 'AKIAJ33C3Q6RFI4FRHCA'
    AWSSecretAccessKey: '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'

    bucket: "winesail-images",
    
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
      "test/#{Meteor.uuid()}_#{file.name}"