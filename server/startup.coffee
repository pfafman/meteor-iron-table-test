
getSelect = ->
  num = Math.round(Math.random()*3)
  switch "#{num}"
    when '0'
      'zero'
    when '1'
      'one'
    when '2'
      'two'
    when '3'
      'three'


Meteor.startup ->
  console.log("Server Start Up")

  # Populate test data into Mongo
  testCount = 200
  if TestData.find().count() < testCount
    TestData.remove({})
    for i in [0 .. testCount-1]
      main_id = TestData.insert
        title: "Item #{i}"
        value: i
        invert: testCount - i
        comment: "This is a comment for #{i}"
        created: new Date()
        last_update: new Date()
        random: Math.random()*100
        select: getSelect()

        location:
          type: "Point"
          coordinates: [180*Math.random(), 90*Math.random()]
      

  # S3.aws.listBuckets (err, rtn) ->
  #   if err
  #     console.log("listBuckets error:", err)
  #   else
  #     console.log("listBuckets:", rtn)
  #     for bucket in rtn.Buckets
  #       console.log("Bucket: ", bucket.Name, ' : ', bucket.CreationDate)
      