gulp       = require 'gulp'
riot       = require 'gulp-riot'
jade       = require 'gulp-jade'
coffee     = require 'gulp-coffee'
plumber    = require 'gulp-plumber'

gulp.task 'coffee', ->
	gulp.src './src/**/*.coffee'
		.pipe plumber()
		.pipe coffee()
		.pipe gulp.dest './src/'

gulp.task 'riot', ->
	gulp.src './src/view/component/*.tag'
		.pipe plumber()
		.pipe riot
			compact  : true
			type     : 'coffeescript'
			template : 'pug'
		.pipe gulp.dest './src/view/component'

gulp.task 'jade', ->
	gulp.src './src/view/html/*.jade'
		.pipe plumber()
		.pipe jade()
		.pipe gulp.dest './src/view/html'

gulp.task 'default', ['coffee', 'riot', 'jade']
