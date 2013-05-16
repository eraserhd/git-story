StoryDiffer = require '../../lib/actions/diff'
expect = require 'expect.js'

describe 'StoryDiffer', ->

  beforeEach ->
    @options =
      parameters: []

    @consoleMessages = ''
    @console =
      log: (message) =>
        @consoleMessages += message

    @diff = new StoryDiffer @console

  it 'refuses any arguments', (done) ->
    @options.parameters = ['foo']
    @diff.run @options, =>
      expect(@consoleMessages).to.match /Don't know what to do with 'foo'/
      done()

