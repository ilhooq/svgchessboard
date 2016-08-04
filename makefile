
APP=svg.chessboard
SOURCES=$(APP).js
BOWER=bower_components
VERSION=0.0.1

.PHONY : all jshint package install clean clean-dev 

all: $(APP).min.js

# Compress javascript code
# uglifyjs tool must be installed before with this command :
# npm install -g uglify-js
$(APP).min.js: $(SOURCES)
	uglifyjs $(SOURCES) -o $(APP).min.js


# Check javascript code
# If jshint is not installed, install it with this command : 
# npm install -g jshint
jshint:
	jshint --verbose --show-non-errors $(APP).js

package: install
	zip -r $(APP).js-${VERSION}.zip themes bower_components/svg.js/dist/ bower_components/svg.draggable.js/dist/ $(APP).min.js $(APP).js

# Install dependencies
# bower must be installed before with this command :
# npm install -g bower
install:
	bower install

clean:
	rm $(APP).min.js *.zip

clean-dev:
	rm -rf ${BOWER}



