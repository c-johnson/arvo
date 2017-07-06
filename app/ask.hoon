::
::::  /hoon/ask/app
  ::
/?    310
/+    sole, womb, prey
[. sole]
|%
  ++  card
    $%  {$diff $sole-effect sole-effect}
        {$poke wire {ship $hood} $womb-invite {cord invite}:womb}
    ==
  ++  invited  ?($new $sent $ignored)
  ++  email  @t
--
::
=,  ^gall
=|  mow/(list {bone card})
|_  $:  bow/bowl
        adr/(map email {time invited})
        sos/(map sole-id {sole-share (list sole-effect)})
        wom/(unit ship)
        admins/(set ship)
    ==
++  abet
  ^-  (quip {bone card} .)
  [(flop mow) .(mow ~)]
::
++  emit  |=(a/card +>(mow [[ost.bow a] mow]))
++  spam-effect
  |=  a/sole-effect  ^+  +>
  %+  roll  (~(tap by sos))
  |:  [*{sid/sole-id ^} +>.$]
  abet:(give-effect:(di sid) a)
::
::
++  poke-ask-admins
  |=  a/(set ship)
  ?>  =(our.bow src.bow)
  abet(admins a)
::
++  poke-ask-mail
  |=  ask/@t
  =<  abet  ^+  +>
  ~|  have-mail+ask
  ?<  (~(has by adr) ask)
  =.  adr  (~(put by adr) ask now.bow %new) :: XX electroplating
  %-  spam-effect
  =/  new  [now.bow ask %new]
  [%mor tan+[(message new)]~ pro+prompt (put-mail new) ~]
::
++  poke-sole-action  :: DEPRECATED
  |=  act/sole-action
  =/  sid/sole-id  [ost our dap]:bow
  (poke-sole-id-action sid act)
::
++  poke-sole-id-action
  |=  {sid/sole-id act/?($new sole-action)}
  =<  abet:abet  ^+  *di
  ~|  [%not-in-whitelist src.bow]
  ?>  |((~(has in admins) src.bow) =(our.bow src.bow))
  ?:  ?=($new act)
    (new-di sid)
  (poke-action:(di sid) act)
::
++  peer-sole
  |=  pax/path
  =<  abet:abet  ^+  *di
  =^  sid/sole-id  pax
    ?~  pax  [[ost our dap]:bow pax]  ::  DEPRECATED
    [(decode-id:sole i.pax) t.pax]
  ?^  pax  ~|(%bad-path !!)
  ~|  [%not-in-whitelist src.bow]
  ?>  |((~(has in admins) src.bow) =(our.bow src.bow))
  (peer:(new-di sid) pax)                ::  XX explicit %new act
::
++  new-di  |=(sid/sole-id =.(sos (~(put by sos) sid *sole-share ~) (di sid)))
++  di
  |=  sid/sole-id
  =|  sef/(list sole-effect)
  =+  [som fec]=(~(got by sos) sid)
  |%
  ++  this  .
  ++  abet
    ^+  ..di
    =/  mos/(list {bone card})
      ?~  sef  ~
      =/  cad  (effect %mor (flop sef))
      %+  turn  (prey /sole/(encode-id:sole sid) bow)
      |=({ost/bone ^} [ost cad])
    ..di(mow (welp mos mow), sos (~(put by sos) sid som fec))
  ::
  ++  emit  |=(a/card +>(..di (^emit a)))
  ++  give-effect  |=(a/sole-effect +>(sef [a sef]))
  ++  effect  |=(fec/sole-effect [%diff %sole-effect fec])
  ::
  ::
  ++  transmit
    |=  dit/sole-edit  ^+  +>
    =^  det  som  (~(transmit shared:sole som) dit)
    (give-effect det+det)
  ::
  ++  remit
    |=  {cal/sole-change ask/$-((list @c) ?)}
    ^+  [*? this]
    =^  lic  som
      (~(remit shared:sole som) cal ask)
    ?~  lic  [& this]
    [| (give-effect det+u.lic)]
  ::
  ++  read-reject
    |=  cal/sole-change  ^+  ["" this]
    =^  inv  som  (~(transceive shared:sole som) cal)
    :-  (tufa buf.som)
    (transmit inv)
  ::
  ::
  ++  poke-action--no-womb-ship
    |=  act/sole-action  ^+  this
    ?-    -.act
        $clr  this
        $ret
      ?:  =(~ buf.som)
        (give-effect txt+"Please enter womb ship")
      =/  try  (rose (tufa buf.som) fed:ag)
      ?.  ?=({$& ^} try)
        (give-effect bel+~)
      =.  wom  p.try
      =>  (transmit set+~)
      (give-effect pro+prompt)   :: XX handle multiple links?
    ::
        $det
      =^  gud  this
        %+  remit  +.act
        |=  buf/(list @c)
        ?=({$& *} (rose (tufa buf) fed:ag))
      ?:  gud  this
      (give-effect bel+~)
    ==
  ::
  ++  poke-action
    |=  act/sole-action
    ?:  =(~ wom)
      (poke-action--no-womb-ship act)
    ?-    -.act
        $clr  this
        $ret  (give-effect mor+help)
        $det                              :: reject all input
      =^  buf  this  (read-reject +.act)
      ::
      ?:  =("?" buf)  (give-effect mor+help)
      ?:  =("a" buf)  (give-effect (render adrs))
      ?:  =("l" buf)  (give-effect (render new-adrs))
      ?:  =("i" buf)  (give-effect (render ignored-adrs))
      ?:  =("w" buf)  =.(wom ~ (give-effect pro+prompt))
      ?:  =("n" buf)
        =/  new  new-adrs
        ?~  new  (give-effect bel+~)
        =.  inv.i.new  %ignored
        =.  adr  (~(put by adr) ask.i.new [tym inv]:i.new)
        (give-effect %mor tan+[(message i.new)]~ pro+prompt ~)
      ?:  =("y" buf)
        =/  new  new-adrs
        ?~  new  (give-effect bel+~)
        =.  inv.i.new  %sent  :: XX pending
        =.  emit  (emit (invite ask.i.new))
        =.  adr  (~(put by adr) ask.i.new [tym inv]:i.new)
        (give-effect %mor tan+[(message i.new)]~ pro+prompt ~)
      (give-effect bel+~)
    ==
  ::
  ++  peer
    |=  path  ^+  this
    %-  emit
    %^  effect  %mor
      pro+prompt
    =+  all=adrs
    [(render all) (turn all put-mail)]
  --
::
++  prompt
  ^-  sole-prompt
  ?~  wom  [& %ask-ship ":womb-ship? ~"]
  =/  new  new-adrs
  ?~  new  [& %$ "<listening> (0) [l,a,i,w,?]"]
  [& %$ ": approve {<ask.i.new>}? ({<(lent new)>}) [y,n,l,a,i,w,?]"]
::
++  render                            :: show list of invites
  |=  a/(list {time email invited})  ^-  sole-effect
  ?:  =(~ a)  txt+"~"
  tan+(flop (turn a message))
::
++  adrs
  =-  (sort - lor)
  %+  turn  (~(tap by adr))
  |=({a/email b/time c/invited} [tym=b ask=a inv=c])
::
++  new-adrs  (skim adrs |=({@ @ inv/invited} =(%new inv)))
++  ignored-adrs  (skim adrs |=({@ @ inv/invited} =(%ignored inv)))
++  message
  |=  {now/time ask/@t inv/invited}  ^-  tank
  =.  now  (sub now (mod now ~s1))
  leaf+"ask: {<inv>} {<now>} {(trip ask)}"
::
++  put-mail
  |=  {@ ask/@t inv/invited}
  =/  pax  (rash ask unix-path)
  [%sav pax `@t`inv]
::
++  unix-path  ::  split into path of "name" and "extension"
  ;~  (glue dot)
    (cook crip (star ;~(less dot next)))
    ;~(plug (cook crip (star next)) (easy ~))
  ==
::
++  help
  ^-  (list sole-effect)
  =-  (scan - (more (just '\0a') (stag %txt (star prn))))
  %+  welp
    ?~  [new-adrs]  ""
    """
    y - invite current ask
    n - ignore current ask

    """
  """
  l - list new asks
  i - list ignored asks
  a - list all asks
  w - reset womb ship
  ? - print help
  """
::
++  invite
  |=  ask/email
  ^-  card
  :^  %poke  /invite/(scot %t ask)  [(need wom) %hood]
  :-  %womb-invite
  ^-  {cord invite}:womb
  =+  inv=(scot %uv (end 7 1 eny.bow))
  [inv [ask 1 0 "You have been invited to Urbit: {(trip inv)}" ""]]
--
