Test site for Meteor / Materializecss 
=====================================

Test site for some of my meteor packages that use [Materializecss](http://materializecss.com)

**Viewable [here](http://pfafman.meteor.com)**

## Install

Clone the repo and then create a `settings.json` file with S3 keys or a fake one like:

```
{
  "AWSAccessKeyId": "FAKE",
  "AWSSecretAccessKey": "FAKE"
}
```
This is needed for [slingshot](https://atmospherejs.com/edgee/slingshot) which is used to test S3 file uploads.

Run meteor

```
meteor --settings settings.json
```

## Notes
### WIP
