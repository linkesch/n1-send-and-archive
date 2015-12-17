{Utils, DraftStore, React, TaskFactory, FocusedMailViewStore, Actions} = require 'nylas-exports'
{RetinaImg} = require 'nylas-component-kit'

class SendAndArchiveButton extends React.Component

  # Note: You should assign a new displayName to avoid naming
  # conflicts when injecting your item
  @displayName: 'SendAndArchiveButton'

  # When you register as a composer button, you receive a
  # reference to the draft, and you can look it up to perform
  # actions and retrieve data.
  @propTypes:
    draftClientId: React.PropTypes.string.isRequired

  render: =>
    <div className="send-and-archive">
      <button className="btn btn-toolbar" onClick={ => @_onClick()} ref="sendAndArchiveButton">
        Send &amp; Archive
      </button>
    </div>

  _onClick: =>
    # Click send button
    sendButton = React.findDOMNode(this.refs.sendAndArchiveButton).parentElement.parentElement.parentElement.getElementsByClassName('btn-send')[0]
    event = new MouseEvent('click', {
      'view': window,
      'bubbles': true,
      'cancelable': false
    })
    sendButton.dispatchEvent(event)

    # Archive
    if DraftStore.isSendingDraft(@props.draftClientId)
      task = TaskFactory.taskForArchiving
        threads: [@props.threadId],
        fromView: FocusedMailViewStore.mailView()
      Actions.queueTask(task)
      Actions.popSheet()


module.exports = SendAndArchiveButton
