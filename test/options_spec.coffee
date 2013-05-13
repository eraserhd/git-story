Options = require '../lib/options'
expect = require 'expect.js'

describe Options, ->

  describe 'Options.parse', ->

    beforeEach ->
      @options = Options.parse ['/foo/bar/git-story', 'start', 'whatevs', 'bar']

    it 'locates the action', ->
      expect(@options.action).to.be 'start'

    it 'locates the git-story path', ->
      expect(@options.path).to.be '/foo/bar/git-story'

    it 'locates the remaining arguments', ->
      expect(@options.parameters).to.eql ['whatevs', 'bar']
