^-  manx
;html
  ;head
    ;title: Recessional | Poast
    ;link(type "text/css", rel "stylesheet", href "https://urbit.github.io/base-css/base.css");
    ;link(type "text/css", rel "stylesheet", href "./recessional.css");
    ;meta(name "viewport", content "width=device-width,initial-scale=1.0");
    ;script(src "https://sdk.amazonaws.com/js/aws-sdk-2.181.0.min.js");
    ;script(type "text/javascript", src "/~/at/lib/js/urb.js");
    ;script(type "text/javascript", src "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js");
    ;script(type "text/javascript", src "./recessional.js");
  ==
  ;body
    ;div.container
      ;div.header
        ;div(class "row nav text-400")
          ;a(href "recessional", class "mr-2"): Home
          ; | 
          ;a(href "chat", class "ml-2 mr-2"): Chat 
          ; | 
          ;a(href "about", class "ml-2 mr-2"): About
        ==
        ;div(class "row title")
          ;h1: Poast
        ==
      ==
      ;div.row
        ;button(class "mode btn text btn-secondary")
          ; Text
        ==
        ;button(class "mode btn image")
          ; Image
        ==
      ==
      ;div.row
        ;div(class "post-input col-md-12 text")
          ;textarea#post-text(class "h-80 text-code");
          ;div.image-url
            ;input#photoupload(type "file", accept "image/*");
            ;input(type "text", class "text-code image-url", placeholder "image_url");
          ==
        ==
      ==
      ;div(class "row mt-4")
        ;button#submit(class "btn btn-primary")
          ; Submit
        ==
        ;button#upload(class "btn btn-secondary")
          ; Upload
        ==
      ==
    ==
  ==
==
