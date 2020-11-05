import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.content.text}</p>`;
    const com  = `<p>${data.content.user.nickname}</p>`;
    const messages = document.getElementById('messages');
    const messagename = document.getElementById('messagesname');
    const newMessage = document.getElementById('message_text');
    messages.insertAdjacentHTML('afterbegin', html);
    messagename.insertAdjacentHTML('afterbegin', com);
    newMessage.value='';
  }
});
