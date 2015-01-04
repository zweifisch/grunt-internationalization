# grunt-internationalization

> grunt plugin for internationalization

## Getting Started
This plugin requires Grunt `~0.4.5`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-internationalization --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-internationalization');
```

## The "internationalization" task

### Usage Examples

#### generate angularjs module

```js
grunt.initConfig({
  internationalization: {
    angular: {
      output: 'build/i18n', // required
      module: 'i18n',
      service: 'i18n',
      filter: 'translate',
      nsSeparator: ':',
      defaultNs: 'defualt'
      path: 'locales'
    },
  },
});
```

#### generate javascript

```js
grunt.initConfig({
  internationalization: {
    javascript: {
      output: 'build/i18n', // required
      exportAs: 'i18n'
      path: 'locales'
    },
  },
});
```
