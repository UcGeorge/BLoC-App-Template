
help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
			IFS=$$'#' ; \
			help_split=($$help_line) ; \
			help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
			help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
			printf "%-30s %s\n" $$help_command $$help_info ; \
	done

fresh: ## Runs `clean`, `codegen-build`, and `generate-intl` for a fresh setup.
	make codegen-root

pubget-flutter-messages:
	(flutter pub get;)
codegen-root:
	(flutter clean;flutter pub get)


clean: ## Cleans Flutter project.  flutter pub run build_runner build --delete-conflicting-outputs
	rm -f pubspec.lock
	rm -f ios/Podfile.lock
	flutter clean
	flutter pub get
	flutter pub upgrade
	flutter pub get
	cd ios && pod repo update && pod install && cd ..
	
build-runner: ## Runs build_runner
	dart run build_runner build --delete-conflicting-outputs

lint: ## Runs `flutter analyze`.
	flutter analyze

format: ## Formats dart files.
	dart format .

test-unit: ## Runs unit tests.
	flutter test

run: ## Runs app
	flutter run

appbundle-dev: ## Builds appbundle
	flutter build appbundle

apk-dev: ## Builds apk
	flutter build apk

update-pods: ## flutter packages get
	flutter pub upgrade --major-versions
	cd ios && pod deintegrate
	rm -f Podfile.lock && cd ..
	pod install --repo-update

record-ios:
	xcrun simctl io booted recordVideo --force ./appVideo.mov

build-android:
	clear
	make clean
	clear
	make appbundle-dev
	rm -rf ./.appbundles
	mkdir ./.appbundles
	mv ./build/app/outputs/bundle/release/app-release.aab ./.appbundles/
	open ./.appbundles
