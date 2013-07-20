module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffeelint:
      app: ['app/**/*.coffee', 'config/**/*.coffee']

    cssmin:
      combine:
        files:
          'assets/css/main.min.css': [
            'assets/css/vendor/bootstrap.css'
            'assets/css/vendor/bootstrap-responsive.css'
          ]


    uglify:
      options:
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      build:
        src:[
          'assets/js/lib/sarge.js',
          'assets/js/lib/sarge-eventually.js',
          'assets/js/lib/sarge-standards-css-select.js',
          'assets/js/sarge-fu.js',
          'assets/js/lib/js-unzip.js',
          'assets/js/lib/js-inflate.js',
          'assets/js/lib/js-epub.js',
          'assets/js/lib/copperplate.js',
          'assets/js/booktorious.js',
          'assets/js/booktorious/loading.js',
          'assets/js/booktorious/reader.js',
          'assets/js/booktorious/spine_entry.js',
          'assets/js/application.js',
          'assets/js/vendor/jquery.min.js'
          'assets/js/vendor/bootstrap.js'
        ]
        dest: 'assets/js/<%= pkg.name %>.min.js'

  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'

  grunt.registerTask 'default', [
    'coffeelint'
    'cssmin'
    'uglify'
  ]

  return
