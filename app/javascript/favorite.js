function favorite (){
  document.addEventListener("click", function(event) {
    const favoriteBtn = event.target.closest("#favorite_btn");
    if (!favoriteBtn) return; // クリックした要素がボタンでなければ終了

    event.preventDefault(); // フォームの通常の送信を防ぐ

    const form = favoriteBtn.closest("form");
    const formData = new FormData(form);
    const method = form.getAttribute("method"); // POST or DELETE
    const action = form.getAttribute("action"); // 送信先URL

    fetch(action, {
      method: method,
      body: formData,
      headers: { "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content }
    })
    .then(response => response.text())
    .then(() => {
      if (method === "post") {
        favoriteBtn.src = "/assets/pheart.png"; // 登録時はpheart.pngに変更
        form.setAttribute("method", "delete");
        form.setAttribute("action", action.replace("/favorites", `/favorites/${formData.get("favorite_id")}`));
      } else {
        favoriteBtn.src = "/assets/wheart.png"; // 削除時はwheart.pngに変更
        form.setAttribute("method", "post");
        form.setAttribute("action", action.replace(`/favorites/${formData.get("favorite_id")}`, "/favorites"));
      }
    })
    .catch(error => console.error("Error:", error));
  });
}

 window.addEventListener('turbo:load', favorite);