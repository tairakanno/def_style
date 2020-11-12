import consumer from "./consumer"

consumer.subscriptions.create("ItemCommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.content.text},${data.content.created_at}</p>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('item_comment_text');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
    // Called when there's incoming data on the websocket for this channel
  }
});
