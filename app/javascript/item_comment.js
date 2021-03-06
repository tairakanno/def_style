function item_comment (){
  const submit = document.getElementById("item-submit");
  submit.addEventListener("click", (e) => {
  const formData = new FormData(document.getElementById("form"));
  const XHR = new XMLHttpRequest();
  XHR.open("POST", "/items/${itemId}//item_comments", true);
  XHR.responseType = "json";
  XHR.send(formData);
  XHR.onload = () => {
    // console.log(XHR.response.item_comment);
    if (XHR.status != 200) {
      alert(`Error ${XHR.status}: ${XHR.statusText}`);
      return null;
    }
    const item = XHR.response.item_comment;
    const list = document.getElementById("list");
    const formText = document.getElementById("text");
    const HTML = `
      <div class="post" data-id=${item.id}>
        <div class="post-date">
          投稿日時：${item.created_at}
        </div>
        <div class="post-content">
        ${item.text}
        </div>
      </div>`;
    list.insertAdjacentHTML("afterend", HTML);
    formText.value = "";
  };
  e.preventDefault();
});
}
window.addEventListener("load", item_comment);
