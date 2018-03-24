::::  /hoon/recessional/web
::
/-  entry
/+  old-zuse
::=,  old-zuse
/=  gas  /$  fuel:html
::
/=  entries  /:  /===/web/pages/recessional
             /^  (map knot entry)  /_  /blerg-entry/
::
::
|%
++  page
  ^-  @ud
  =/  a  (~(get by qix.gas) %page)
  ?~  a  0
  :: this can be better handled with bind?
  (need (slaw %ud (need a)))
++  page-size  5
++  paginate
  |=  [a=(map knot entry) c=@ud]
  ^-  (list [@t entry])
  =/  b  
  %+  sort 
    ~(tap by a) 
  |=  [x=(pair knot entry) y=(pair knot entry)]
  (gth (unt:old-zuse (slav %da p.x)) (unt:old-zuse (slav %da p.y)))
  ?:  (lte (lent b) page-size)
    b
  %+  swag
    [(mul c page-size) page-size] 
  b
++  authed
    %+  lien
      ~(tap in (~(get ju aut.ced.gas) %$)) 
    |=  a/knot 
    =((scot %p p.bem.gas) a)
--
::
^-  manx
:: 
;html
  ;head
  ;title: Recessional
  ;link(type "text/css", rel "stylesheet", href "https://urbit.github.io/base-css/base.css");
  ;link(type "text/css", rel "stylesheet", href "./pages/recessional.css");
  ;meta(name "viewport", content "width=device-width,initial-scale=1.0");
  ==
  ;body
    ;div.container
      ;div
        ;div.header
          ;div(class "row nav text-400")
            ;a(href "", class "mr-2"): Home
            ; | 
            ;a(href "pages/chat", class "ml-2 mr-2"): Chat 
            ; | 
            ;a(href "pages/about", class "ml-2 mr-2"): About
            ;*  ?:  authed
              ;=
                ; | 
                ;a(href "pages/poast", class "ml-2 mr-2"): Poast
              ==
            ;=
              ; | 
              ;a(href "~~", class "ml-2 mr-2"): Login
            ==
          ==
          ;div(class "row title")
            ;h1: Recessional
          ==
        ==
        :: entries
        ;*  %+  turn  
              (paginate entries page)
            |=  [a=@t b=entry] 
            ;div(class "entry row mb-20 {(trip type.b)}")
              ;div(class "col-sm-12 col-md-6")
                ;div(class "datestamp text-mono")
                  ;a(href "pages/recessional/{(trip a)}.blurb"): {(trip a)}
                ==
              ==
              ;div(class "col-sm-12 col-md-6")
                +{body.b}
              ==
            ==
        :: page nav
        :: only show nav if there are more entries than page size
        ;*  ?:  (gth (lent ~(tap by entries)) page-size)
              ;=
                ;div#page-nav.row
                  ;div(class "col-md-6 col-md-offset-6")
                    ;*  ?:  (gth page 0)
                      ;=
                        ;button(class "btn-sm btn-tetiary")
                          ;a(href "?page={(scow %ud (sub page 1))}")
                            ; Prev
                          ==
                        ==
                      ==
                    ;=
                      ;button(class "btn-sm disabled")
                        ; Prev
                      ==
                    ==
                    ;*  ?:  (gte (lent ~(tap by entries)) (mul page-size (add page 1)))
                      ;=
                        ;button(class "btn-sm btn-tetiary")
                          ;a(href "?page={(scow %ud (add page 1))}")
                            ; Next
                          ==
                        ==
                      ==
                    ;=
                      ;button(class "btn-sm disabled")
                        ; Next
                      ==
                    ==
                  ==
                ==
              ==
            ~
      ==
    ==
  ==
==
