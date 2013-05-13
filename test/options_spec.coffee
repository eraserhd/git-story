Options = require '../lib/options'
assert = require 'assert'

describe Options, ->

  describe '#parse', ->
    it 'can identify the action', ->
      assert.equal('start', Options.parse(['/foo/bar/git-story', 'start', 'whatevs']).action)
