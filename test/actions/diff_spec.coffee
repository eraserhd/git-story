StoryDiffer = require '../../lib/actions/diff'
expect = require 'expect.js'
events = require 'events'

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
        @spawnCommand = command
        @spawnArgs = args
        @process = new events.EventEmitter
        @process.on 'newListener', =>
          process.nextTick =>
            @process.emit 'exit', 0, null

        @process

    @diff = new StoryDiffer @console, @child_process

  it 'refuses any arguments', (done) ->
    @options.parameters = ['foo']
    @diff.run @options, =>
      expect(@consoleMessages).to.match /don't know what to do with 'foo'/
      done()

  it 'runs \'git diff origin/master...HEAD\'', (done) ->
    @diff.run @options, =>
      expect(@consoleMessages).to.be ''
      expect(@spawnCommand).to.be 'git'
      expect(@spawnArgs).to.be.eql ['diff', 'origin/master...HEAD']
      done()
