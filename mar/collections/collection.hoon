::  /mar/collections/config/hoon
::
/-  *collections
|_  col=collection
::
++  grow
  |%
  ++  elem  :: web display
    ;div
      ;h1: {(trip desc.conf.col)}
      ;p: updated {<mod.conf.col>}
      ::TODO public, visible
      ::
      ;*  ?~  tops.col  ~
          ;=  ;h2: Topics:
          ==
      ;ul
        ;*  %+  turn  (sort ~(tap by tops.col) dor)
            |=  [top=@da topicful]
            ;li
              ;a/"{<top>}/": {(trip tit.info)} ({<~(wyt by coms)>} comments)
            ==
      ==
      ::
      ;hr;
      ::
      ;h2: Post topic:
      ;script@"/lib/js/easy-form.js";
      ;form(onsubmit "return easy_form.submit(this)")
        ;input(type "hidden", name "easy_form:mark", value "collections-action");
        ;input(type "hidden", name "easy_form:tag", value "submit");
        ;input(type "hidden", name "easy_form:url_end", value "collections/:col");
        ::
        ;input(name "tit", placeholder "Title");
        ;br;  ;textarea(name "wat", placeholder "Enter topic text");
        ;br;  ;input(type "submit");
      ==
      ::
      ;hr;
      ::
      ;form(onsubmit "return easy_form.submit(this)")
        ;input(type "hidden", name "easy_form:mark", value "collections-action");
        ;input(type "hidden", name "easy_form:tag", value "delete");
        ;input(type "hidden", name "easy_form:url_end", value "collections/:col");
        ;input(type "hidden", name "easy_form:confirm");
        ::
        ;input.red(type "submit", value "Archive this collection");
      ==
    ==
  --
::
++  grab
  |%
  ++  noun  collection
  --
--
