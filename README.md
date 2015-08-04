# meteor-cfs-safari-check

This sample application shows error with file uploading on current Meteor mobile IOS builds.

# Steps to reproduce
1. Clone project

	git clone https://github.com/dmitry-sher/meteor-cfs-safari-check.git

2. Open cloned project directory.
3. Run build script
	./run-ios.sh

4. When XCode opens, choose your target device and hit 'run'. If application asks for a permission, give it.

5. The project opens instantly with a Camera. Press 'Cancel'.

6. File choose input appears. Hit 'choose file' and choose random image from gallery or Moments.

7. Progress 'loading...' appears.

8. Wait 30 seconds and times out.

# What is working
 - shooting photo is working
 - choosing photo in simulator is working
 - choosing photo in desktop browser is working

# What is not working
 - choosing photo from mobile device is not working

# Devices tested so far
 - iPhone 5s IOS 8.3 ME433RU/A

# Logs
Relevant logs are included in LOGS.txt