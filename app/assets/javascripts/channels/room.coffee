$ ->
  messages = $('#messages-list')
  if $('#current-user').size() > 0
    App.messages = App.cable.subscriptions.create {
        channel: "RoomChannel"
      },
      connected: ->
        # Called when the subscription is ready for use on the server
        console.log 'test room.coffee'
      disconnected: ->
        # Called when the subscription has been terminated by the server
      received: (data) ->
        unless data.content.blank?
          if $('#messages-list').data('conversation-id') == data.conversation_id
            message_template =
            """
             <li>
                <div class="row">
                  <div class='#{if $('#messages-list').data('current-user-id') == data.by_user_id then 'message-sent' else 'message-received'}'>
                    #{data.content}
                  </div>
                </div>
              </li>
            """
            $('#messages-list > ul').append message_template
            scroll_bottom()
          else
            notification_dot = """<svg id="notification_dot"><circle cx="3" cy="3" r="3"></circle></svg>"""
            $('#message_navb').append notification_dot

$ ->
  if $('#inbox').size() > 0
    submit_message()
    scroll_bottom()
submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13
      $('#send_message').click()
      event.target.value = ""
      event.preventDefault()
scroll_bottom = () ->
  $('#messages-list').scrollTop($('#messages-list')[0].scrollHeight)
