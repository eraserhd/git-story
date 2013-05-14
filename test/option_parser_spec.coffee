OptionParser = require '../lib/option_parser'
expect = require 'expect.js'

describe OptionParser, ->

  describe '#parse', ->

    beforeEach ->
      @fakeConfig =
        foo: 42
        bar: "hello, world!"

      fakeConfigReader =
        readConfig: (callback) =>
          callback @fakeConfig

      @parser = new OptionParser fakeConfigReader
      @argv = ['/foo/bar/git-story', 'start', 'whatevs', 'bar']

    it 'locates the action', (done) ->
      @parser.parse @argv, (error, options) =>
        throw error if error
        expect(options.action).to.be 'start'
        done()

    it 'locates the git-story path', (done) ->
      @parser.parse @argv, (error, options) =>
        throw error if error
        expect(options.path).to.be '/foo/bar/git-story'
        done()

    it 'locates the remaining arguments', (done) ->
      @parser.parse @argv, (error, options) =>
        throw error if error
        expect(options.parameters).to.eql ['whatevs', 'bar']
        done()

    it 'reads and stores the user\'s config', (done) ->
      @parser.parse @argv, (error, options) =>
        throw error if error
        expect(options.config).to.eql @fakeConfig
        done()

