OptionParser = require '../lib/option_parser'
expect = require 'expect.js'

describe OptionParser, ->

  describe '#parse', ->

    beforeEach ->
      @parser = new OptionParser
      @options = @parser.parse ['/foo/bar/git-story', 'start', 'whatevs', 'bar']

    it 'locates the action', ->
      expect(@options.action).to.be 'start'

    it 'locates the git-story path', ->
      expect(@options.path).to.be '/foo/bar/git-story'

    it 'locates the remaining arguments', ->
      expect(@options.parameters).to.eql ['whatevs', 'bar']
