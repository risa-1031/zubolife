$(function(){
  function buildHTML(content){
    if (content.image){
      let html = 
          `<div class="main>
            <div class="list" >
              <div class= "content_name">
                ${content.text}
              </div>
              <div class="content_time">
                ${content.created_at}
              </div>
            </div>
          </div>`
      return html;
    } else {
      let html = 
      `<div class="main>
        <div class="list" >
          <div class= "content_name">
            ${content.text}
          </div>
          <div class="content_time">
            ${content.created_at}
          </div>
        </div>
      </div>`
      return html;
    };
  }

  let reloadMessages = function() {

    let last_message_id = $('.content:last').data("content-id") || 0;
    $.ajax({
      url: "api/contents",
      type: 'get',
      dataType: 'json',
      data: {id: last_content_id}
    })
    .done(function(content) {
      // 更新するメッセージがなかった場合は.doneの後の処理が動かないようにする
      if (contents.length !== 0) {
        //追加するHTMLの入れ物を作る
        let insertHTML = '';
        //配列messagesの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
        $.each(contents, function(i, content) {
          insertHTML += buildHTML(content)
        });
        //メッセージが入ったHTMLに、入れ物ごと追加
        $('.text-input').append(insertHTML);
        $('.text-input').animate({ scrollTop: $('.main')[0].scrollHeight});
      }
    })
    .fail(function() {
      alert('error');
    });
  };
  setInterval(reloadMessages, 60000);
});