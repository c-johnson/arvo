$(function() {
  //var clicks, $go, $clicks, $err

  $submit     = $('#submit');
  $textarea     = $('#post-text');
  $imgurl     = $('input.image-url');
  $mode     = $('.mode');
  $upload  = $('#upload');

  var region = 'us-west-2';
  var idpool = 'us-west-2:23965244-3e06-4039-b24c-d290048670d6';
  var bucket = 'recess-poast';

  var text = true;

  AWS.config.update({
    region: region,
    credentials: new AWS.CognitoIdentityCredentials({
      IdentityPoolId: idpool
    })
  });

  var s3 = new AWS.S3({
    apiVersion: '2006-03-01',
    params: {Bucket: bucket}
  });

  var uploadPhoto = function() {
    var files = document.getElementById('photoupload').files;
    if (!files.length) {
      return alert('Please choose a file to upload first.');
    }
    var file = files[0];
    var fileName = file.name;

    var photoKey = Math.round(Math.random() * 10) + fileName;
    s3.upload({
      Key: photoKey,
      Body: file,
      ACL: 'public-read'
    }, function(err, data) {
      if (err) {
        return alert('There was an error uploading your photo: ', err.message);
      }
      var s3ImgLink = 'https://s3-' + region + '.amazonaws.com/' + bucket + '/' + photoKey;
      alert('successfull uploaded!');
      $imgurl.val('');
      $imgurl.val(s3ImgLink);
    });
  };

  console.log(s3);

  $submit.on("click",
    function() {
      window.urb.send(
        {
          type: text ? 'text' : 'image',
          body: text ? $textarea.val() : '![](' + $imgurl.val() + ')'
        },
        {mark: "blerg-to-md"}
      ,function(err,res) {
        if (!err) {
          $textarea.val('')
          $imgurl.val('')
        }
        console.log(res);
      })
  });

  $upload.on("click", uploadPhoto)

  $mode.on("click",
    function() {
      console.log('clicked');
      if (text == true) {
        $('button.mode.text').removeClass("btn-secondary");
        $('button.mode.image').addClass("btn-secondary");
        $('div.post-input').removeClass("text");
        text = false;
      } else {
        $('button.mode.text').addClass("btn-secondary");
        $('button.mode.image').removeClass("btn-secondary");
        $('div.post-input').addClass("text");
        text = true;
      }
  });

  window.urb.appl = "poast"
  window.urb.bind('/poast-path',
    function(err,dat) {
      console.log(err);
      console.log(dat);
    }
  )
})
