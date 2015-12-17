{React} = require 'nylas-exports'
ReactTestUtils = React.addons.TestUtils

SendAndArchiveButton = require '../lib/send-and-archive-button'

describe "SendAndArchiveButton", ->
  beforeEach ->
    @onClick = jasmine.createSpy("onClick")
    props = {
      onClick: @onClick
    }
    @component = ReactTestUtils.renderIntoDocument(
      <div>
        <div>
          <SendAndArchiveButton draftClientId="test" />
        </div>
        <button className="btn btn-toolbar btn-emphasis btn-text btn-send" {...props}><span>Send</span></button>
      </div>
    )

  it "should render into the page", ->
    expect(@component).toBeDefined()

  it "should have a displayName", ->
    expect(SendAndArchiveButton.displayName).toBe('SendAndArchiveButton')

  # it "should click a send button when clicked", ->
  #   buttonNode = React.findDOMNode(@component).getElementsByClassName('send-and-archive')[0].getElementsByTagName('button')[0]
  #   ReactTestUtils.Simulate.click(buttonNode)
  #   expect(@onClick).toHaveBeenCalled()

