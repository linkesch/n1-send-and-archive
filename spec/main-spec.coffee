{ComponentRegistry} = require 'nylas-exports'
{activate, deactivate} = require '../lib/main'

SendAndArchiveButton = require '../lib/send-and-archive-button'

describe "activate", ->
  it "should register the composer button", ->
    spyOn(ComponentRegistry, 'register')
    activate()
    expect(ComponentRegistry.register).toHaveBeenCalledWith(SendAndArchiveButton, {role: 'Composer:ActionButton'})

describe "deactivate", ->
  it "should unregister the composer button", ->
    spyOn(ComponentRegistry, 'unregister')
    deactivate()
    expect(ComponentRegistry.unregister).toHaveBeenCalledWith(SendAndArchiveButton)
