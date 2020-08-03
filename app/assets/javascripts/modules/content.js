$(function(){
  function buildHTML(content){
    if (content.keyword){
      let html =
          `<div class="list">
            ${content.text}
          </div>`
      return html;
    } else if (content.image){
      let html = 
          `<div class="wrapper" >
            <div class= "main">
              <div class="listbuy" >
                ${content.user_name}
              <div class="list" >
                <div class= "content_name">
                  ${content.text}
                </div>
                <div class="content_time">
                  ${content.created_at}
                </div>
              </div>
            </div>
          </div>`
      return html;
    } else {
      let html = 
      `<div class="listbuy" >
        ${content.user_name}
          <div class="list" >
            <div class= "content_name">
              ${content.text}
            </div>
            <div class="content_time">
              ${content.created_at}
            </div>
          </div>
        </div>
      </div>`
      return html;
    };
  }


  $('.send-put').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: 'get',
      data: formData,  
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      // let currentDate = new Date(); 
      // currentDate = JSON.stringify(currentDate);

      // // Now currentDate is in a different format... oh gosh what do we do...

      // currentDate = new Date(JSON.parse(currentDate));

      let html = buildHTML(data)
      $('.wrapper').append(html);
      $('form')[0].reset();
      $('.wrapper').animate({ scrollTop: $('.wrapper')[0].scrollHeight});
      $('.send-put').prop('disabled', false);
    })
    .fail(function() {
      alert("通信エラーです。食材が表示できません。");
      $('.send-put').prop("disabled", false);
    });
  })
  // $('a').on('click', function(e){
  //   e.preventDefault();
  //   $(this).parent(".list").remove();

    // let formData = new FormData(this);
    // let url = $(this).attr('action')
    // $.ajax({
    //   url: url,
    //   type: 'get',
    //   data: formData,  
    //   dataType: 'json',
    //   processData: false,
    //   contentType: false
  // })

});