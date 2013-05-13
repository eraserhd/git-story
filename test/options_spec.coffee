Options = require '../lib/options'
assert = require 'assert'

describe Options, ->

  describe '#parse', ->

    it 'locates the action', ->
      assert.equal('start', Options.parse(['/foo/bar/git-story', 'start', 'whatevs']).action)

    it 'locates the git-story path', ->
      assert.equal('/foo/bar/git-story', Options.parse(['/foo/bar/git-story', 'stop']).path)
