if (Meteor.isCordova) {
	// DIRTY HACK
	Meteor.absoluteUrl.defaultOptions.rootUrl = 'http://igft.org:10500';
}