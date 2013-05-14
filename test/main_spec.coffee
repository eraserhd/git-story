Main = require '../lib/main'
expect = require 'expect.js'

class FakeAction
  constructor: ->
    FakeAction.last_one_created = this

  run: (options) ->
    @run_was_called = true

class FakeLoader
  load: (command) ->
    @command_loaded = command
    FakeAction

class FakeOptionParser
  parse: (argv, callback) ->
    callback null,
      action: 'start'

describe Main, ->

  beforeEach ->
    @loader = new FakeLoader
    @parser = new FakeOptionParser
    @main = new Main @loader, @parser

  it 'loads the action', ->
    @main.main(['/foo/bar/git-story', 'start', 'foo'])
    expect(@loader.command_loaded).to.be 'start'

  it 'runs the action', ->
    @main.main(['/foo/bar/git-story', 'start', 'foo'])
    expect(FakeAction.last_one_created.run_was_called).to.be.ok()

