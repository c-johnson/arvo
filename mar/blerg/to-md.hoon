::
::::  /hoon/to-md/blerg/mar
  ::
/?    310
/+  old-zuse 
=,  old-zuse
|_  ent/{type/@t body/@t}
++  grow                                                ::  convert to
  |%  ++  mime  [/text/txt 0 '']               ::  convert to %mime
  ::    ++  elem  ;style                                  ::  convert to %hymn
  ::                ;-  (trip mud)
  ::              ==
  ::    ++  hymn  ;html:(head:"{elem}" body)
  --
++  grab
  |%                                                    ::  convert from
  ::++  mime  |=({p/mite q/octs} (@t q.q))
  ::++  noun  @t                                         ::  clam from %noun
  ++  json  
    |=  jon/^json
    ^-  {type/@t body/@t}
    %-  need
    %.  jon
    (ot type+so body+so ~):jo
  --
++  grad  %mime
--
