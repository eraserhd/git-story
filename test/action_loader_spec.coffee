ActionLoader = require '../lib/git-story/action_loader'
expect = require 'expect.js'

describe 'ActionLoader', ->

  beforeEach ->
    @required = []
    @loader = new ActionLoader (file) =>
      @required.push file

  it 'requires a file with the action name from actions/', ->
    @loader.load 'foo'
    expect(@required).to.be.match /\/actions\/foo$/

