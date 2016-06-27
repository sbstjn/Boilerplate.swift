MODULE_NAME=Boilerplate

ifdef XCODEBETA
	XCODEBUILD=/Applications/Xcode-beta.app/Contents/Developer/usr/bin/xcodebuild
else
	XCODEBUILD=xcodebuild
endif

clean:
	$(XCODEBUILD) clean -project $(MODULE_NAME).xcodeproj

test: clean
	$(XCODEBUILD) test -project $(MODULE_NAME).xcodeproj -scheme $(MODULE_NAME)-OSX | xcpretty -c

test-ios: clean
	$(XCODEBUILD) test -project $(MODULE_NAME).xcodeproj -scheme $(MODULE_NAME)-iOS -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6' | xcpretty -c

test-tv: clean
	$(XCODEBUILD) test -project $(MODULE_NAME).xcodeproj -scheme $(MODULE_NAME)-tvOS -sdk appletvsimulator -destination 'platform=tvOS Simulator,name=Apple TV 1080p' | xcpretty -c

test-watch: clean
	$(XCODEBUILD) build -project $(MODULE_NAME).xcodeproj -scheme $(MODULE_NAME)-watchOS -sdk watchsimulator -destination 'platform=watchOS Simulator,name=Apple Watch - 42mm' | xcpretty -c

docker-build:
	docker build -t "sbstjn/boilerplate-swift" .

docker-run: docker-build
	docker run -it --rm "sbstjn/boilerplate-swift"
