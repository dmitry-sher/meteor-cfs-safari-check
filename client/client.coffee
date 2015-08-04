getOnImageInsert = (th) ->
	return (err, fileObj) ->
		if err?
			alert(err)
			return true
		
		errTimeout = setTimeout ->
			alert('upload timeout!')
			Meteor.shared.goToSwiperPage('give')
			return
		, 30000

		Images.find({_id: fileObj._id}).observe 
			changed: (newDocument, oldDocument) ->
				console.log('[images CHANGED] newDocument = ')
				console.log(newDocument)
				if newDocument.copies && newDocument.uploadedAt
					$('.loading').addClass 'hidden'
					clearTimeout errTimeout
					imagesURL = "/cfs/files/images/" + fileObj._id;
					$('img').attr('src', imagesURL)

openStage = ->
	if  Meteor.isCordova
		MeteorCamera.getPicture
			width: 640
			height: 640
			quality: 80
			destinationType: 1
		, (err, data) ->
			$('.loading').removeClass 'hidden'
			if err
				$('.loading').addClass 'hidden'
				console.log err
				Meteor.setTimeout ->
					alert err.message
					$('.fileUpload').removeClass('hidden')
					# openStage th, 1
				, 0
				return true
			Images.insert data, onImageInsert

onFileChosen = (th) ->
	FS.debug = true
	$('.loading').removeClass 'hidden'
	FS.Utility.eachFile event, (file) ->
		Images.insert file, getOnImageInsert(th)

Template.main.helpers
	cordova: -> Meteor.isCordova
	stage2_schema: ->
		new SimpleSchema
			photoId:
				type: Number
				label: "ID"
Template.main.events
	'change .myFileInput': (e) ->
		onFileChosen()

Meteor.startup ->
	openStage()		