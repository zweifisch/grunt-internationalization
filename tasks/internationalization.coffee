###
 * grunt-internationalization
 * https://github.com/zf/grunt-internationalization
 *
 * Copyright (c) 2014 Feng Zhou
 * Licensed under the MIT license.
 *
###

pth = require "path"

module.exports = (grunt)->

    grunt.registerMultiTask 'internationalization', 'grunt plugin for internationalization', ->

        defaults =
            angular:
                module: 'i18n'
                service: 'i18n'
                filter: 'translate'
                nsSeparator: ':'
                defaultNs: 'defualt'
                path: 'locales'
            javascript:
                exportAs: 'i18n'
                path: 'locales'

        angular = grunt.config.get ["internationalization", "angular"]
        if angular
            angular = grunt.util._.merge {}, defaults.angular, angular
            {Translator, bundleAsAngularModule} = require 'internationalization'
            translator = new Translator
            translator.load angular.path

            for lang in translator.speaks()
                path = pth.join angular.output, "#{lang}.js"
                grunt.file.write path, bundleAsAngularModule
                    resource: translator.langs[lang]
                    lang: lang
                    nsSeparator: angular.nsSeparator
                    defaultNs: angular.defaultNs
                    module: angular.module
                    service: angular.service
                    filter: angular.filter
                grunt.log.writeln "File #{path} created."

        javascript = grunt.config.get ["internationalization", "javascript"], javascript
        if javascript
            javascript = grunt.util._.merge {}, defaults.javascript, javascript
            {Translator, bundleAsJavascript} = require 'internationalization'
            translator = new Translator
            translator.load javascript.path

            for lang in translator.speaks()
                path = pth.join javascript.output, "#{lang}.js"
                grunt.file.write path, bundleAsJavascript translator.langs[lang], lang, javascript.exportAs
                grunt.log.writeln "File #{path} created."
