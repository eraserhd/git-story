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

    @child_process =
      spawn: (command, args, options) =>

    @diff = new StoryDiffer @console, @child_process

  it 'refuses any arguments', (done) ->
    @options.parameters = ['foo']
    @diff.run @options, =>
      expect(@consoleMessages).to.match /don't know what to do with 'foo'/
      done()

  it 'runs \'git diff origin/master...HEAD\'', (done) ->
    @diff.run @options, =>
      expect(@consoleMessages).to.be ''
      done()
