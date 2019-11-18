test:
	npx eslint --color --quiet *.js
	node --trace-deprecation --throw-deprecation test.js

publish:
	git push -u --tags origin master
	npm publish

update:
	npx updates -u
	rm -rf node_modules
	npm i

patch:
	$(MAKE) test
	node versions.js -C patch
	$(MAKE) publish

minor:
	$(MAKE) test
	node versions.js -C minor
	$(MAKE) publish

major:
	$(MAKE) test
	node versions.js -C major
	$(MAKE) publish


.PHONY: test publish update patch minor major
