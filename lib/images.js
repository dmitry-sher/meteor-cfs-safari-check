FS.debug = true;

function autoCrop (fileObj, readStream, writeStream) {
	gm(readStream, fileObj.name())
	  .resize('1000', '1000', '^')
	  .gravity('Center')
	  .crop('1000', '1000')
	  .stream()
	  .pipe(writeStream);
}

var imageStore = new FS.Store.GridFS("images", { transformWrite: autoCrop });

Images = new FS.Collection("images", {
 stores: [imageStore],
 filter: {
    allow: {
      contentTypes: ['image/*'] //allow only images in this FS.Collection
    }
  }
});