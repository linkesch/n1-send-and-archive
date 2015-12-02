{React} = require 'nylas-exports'
ReactTestUtils = React.addons.TestUtils

SendAndArchiveButton = require '../lib/send-and-archive-button'

describe "SendAndArchiveButton", ->
  beforeEach ->
    @component = ReactTestUtils.renderIntoDocument(
      <SendAndArchiveButton draftClientId="test" />
    )

  it "should render into the page", ->
    expect(@component).toBeDefined()

  it "should have a displayName", ->
    expect(SendAndArchiveButton.displayName).toBe('SendAndArchiveButton')

  # it "should show a dialog box when clicked", ->
  #   spyOn(@component, '_onClick')
  #  buttonNode = React.findDOMNode(@component.refs.button)
  #  ReactTestUtils.Simulate.click(buttonNode)
  #  expect(@component._onClick).toHaveBeenCalled()
