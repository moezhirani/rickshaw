NODE_BIN=node_modules/.bin
CSS_MIN=$(NODE_BIN)/cleancss
JS_MIN=$(NODE_BIN)/uglifyjs

CSS_FILES=\
	src/css/detail.css\
	src/css/graph.css\
	src/css/legend.css\

JS_FILES=\
	src/js/Rickshaw.Color.Palette.js\
	src/js/Rickshaw.Fixtures.Color.js\
	src/js/Rickshaw.Fixtures.RandomData.js\
	src/js/Rickshaw.Fixtures.Time.js\
	src/js/Rickshaw.Graph.Ajax.js\
	src/js/Rickshaw.Graph.Annotate.js\
	src/js/Rickshaw.Graph.Axis.Time.js\
	src/js/Rickshaw.Graph.Behavior.Series.Highlight.js\
	src/js/Rickshaw.Graph.Behavior.Series.Order.js\
	src/js/Rickshaw.Graph.Behavior.Series.Toggle.js\
	src/js/Rickshaw.Graph.HoverDetail.js\
	src/js/Rickshaw.Graph.js\
	src/js/Rickshaw.Graph.JSONP.js\
	src/js/Rickshaw.Graph.Legend.js\
	src/js/Rickshaw.Graph.RangeSlider.js\
	src/js/Rickshaw.Graph.Renderer.Line.js\
	src/js/Rickshaw.Graph.Renderer.Stack.js\
	src/js/Rickshaw.Graph.Smoother.js\
	src/js/Rickshaw.Graph.Unstacker.js\
	src/js/Rickshaw.Series.js\

.PHONY: build

build: rickshaw.min.css rickshaw.min.js

clean:
	rm -rf rickshaw.css rickshaw.js rickshaw.min.* node_*

$(CSS_MIN):
	npm install clean-css

$(JS_MIN):
	npm install uglify-js

rickshaw.css:
	cat $(CSS_FILES) > rickshaw.css

rickshaw.js:
	cat $(JS_FILES) > rickshaw.js

rickshaw.min.css: $(CSS_MIN) rickshaw.css
	$(CSS_MIN) rickshaw.css > rickshaw.min.css

rickshaw.min.js: $(JS_MIN) rickshaw.js
	$(JS_MIN) rickshaw.js > rickshaw.min.js
