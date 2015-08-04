Meteor.startup(function(){
	Meteor.absoluteUrl.defaultOptions.rootUrl = 'http://igft.org:10500';
	process.env.ROOT_URL = 'http://igft.org:10500';
	process.env.MOBILE_ROOT_URL = 'http://igft.org:10500';
	process.env.MOBILE_DDP_URL = 'http://igft.org:10500';
});