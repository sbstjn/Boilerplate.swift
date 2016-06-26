MODULE_NAME=Boilerplate

test:
	xcodebuild test -project $(MODULE_NAME).xcodeproj -scheme $(MODULE_NAME)-OSX | xcpretty -c

test-ios:
	xcodebuild test -project $(MODULE_NAME).xcodeproj -scheme $(MODULE_NAME)-iOS -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6' | xcpretty -c

test-tv:
	xcodebuild test -project $(MODULE_NAME).xcodeproj -scheme $(MODULE_NAME)-tvOS -sdk appletvsimulator -destination 'platform=tvOS Simulator,name=Apple TV 1080p' | xcpretty -c

test-watch:
	xcodebuild build -project $(MODULE_NAME).xcodeproj -scheme $(MODULE_NAME)-watchOS -sdk watchsimulator -destination 'platform=watchOS Simulator,name=Apple Watch - 42mm' | xcpretty -c
