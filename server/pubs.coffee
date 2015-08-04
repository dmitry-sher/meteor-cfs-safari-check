Meteor.publish 'Images', -> 
	return Images.find()
