Main = require '../lib/main'
expect = require 'expect.js'

describe Main, ->

  it 'loads the action', ->
    command_loaded = false
    loader =
      load: (command) ->
        class DummyAction
          run: (options) ->
        command_loaded = command
        DummyAction

    new Main(loader).main(['/foo/bar/git-story', 'start', 'foo'])
    expect(command_loaded).to.be 'start'

  it 'runs the action', ->
    run_was_called = false
    loader =
      load: (command) ->
        class DummyAction
          run: (options) ->
            run_was_called = true
        DummyAction
    new Main(loader).main(['/foo/bar/git-story', 'start', 'foo'])
    expect(run_was_called).to.be.ok()


