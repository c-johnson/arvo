  =+  [bug=`?`| was=*(set path) wer=*path]
  |%
  ++  gash  %+  cook
              |=  a/(list tyke)  ^-  tyke
              ?~(a ~ (weld i.a $(a t.a)))
            (more fas gasp)
  ++  gasp  ;~  pose
              %+  cook
                |=({a/tyke b/tyke c/tyke} :(weld a b c))
              ;~  plug
                (cook |=(a/(list) (turn a |=(b/* ~))) (star tis))
                (cook |=(a/twig [[~ a] ~]) hasp)
                (cook |=(a/(list) (turn a |=(b/* ~))) (star tis))
              ==
              (cook |=(a/(list) (turn a |=(b/* ~))) (plus tis))
            ==
  ++  glam  ~+((glue ace))
  ++  hasp  ;~  pose
              (ifix [sel ser] wide)
              (stag %call (ifix [pel per] (most ace wide)))
              (stag %sand (stag %t qut))
              %+  cook
                |=(a/coin [%sand ?:(?=({$~ $tas *} a) %tas %ta) ~(rent co a)])
              nuck:so
            ==
  ++  mota  %+  cook
              |=({a/tape b/tape} (rap 3 (weld a b)))
            ;~(plug (star low) (star hig))
  ::
  ++  plex
    |=  gen/twig  ^-  (unit path)
    ?:  ?=({$dbug *} gen)
      $(gen q.gen)
    ?.  ?=({$conl *} gen)  ~
    %+  reel  p.gen
    |=  {a/twig b/_`(unit path)`[~ u=/]}
    ?~  b  ~
    ?.  ?=({$sand ?($ta $tas) @} a)  ~
    `[q.a u.b]
  ::
  ++  pray
    |=  gen/twig  ~|  %pray  ^-  (unit twig)
    ~&  [%pray-disabled gen]
    !!
  ::
  ++  prey
    |=  gun/(list twig)  ^-  (unit twig)
    ?~  gun  `[%$ 1]
    =+  gup=(pray i.gun)
    ?~  gup  ~
    ?~  t.gun  gup
    (bind $(gun t.gun) |=(a/twig [%per u.gup a]))
  ::
  ++  phax
    |=  ruw/(list (list beer))
    =+  [yun=*(list twig) cah=*(list @)]
    =+  wod=|=({a/tape b/(list twig)} ^+(b ?~(a b [[%nub %knit (flop a)] b])))
    |-  ^+  yun
    ?~  ruw
      (flop (wod cah yun))
    ?~  i.ruw  $(ruw t.ruw)
    ?@  i.i.ruw
      $(i.ruw t.i.ruw, cah [i.i.ruw cah])
    $(i.ruw t.i.ruw, cah ~, yun [p.i.i.ruw (wod cah yun)])
  ::
  ++  posh
    |=  {pre/(unit tyke) pof/(unit {p/@ud q/tyke})}
    ^-  (unit (list twig))
    =-  ?^(- - ~&(%posh-fail -))
    =+  wom=(poof wer)
    %+  biff
      ?~  pre  `u=wom
      %+  bind  (poon wom u.pre)
      |=  moz/(list twig)
      ?~(pof moz (weld moz (slag (lent u.pre) wom)))
    |=  yez/(list twig)
    ?~  pof  `yez
    =+  zey=(flop yez)
    =+  [moz=(scag p.u.pof zey) gul=(slag p.u.pof zey)]
    =+  zom=(poon (flop moz) q.u.pof)
    ?~(zom ~ `(weld (flop gul) u.zom))
  ::
  ++  poof  |=(pax/path ^-((list twig) (turn pax |=(a/@ta [%sand %ta a]))))
  ++  poon
    |=  {pag/(list twig) goo/tyke}
    ^-  (unit (list twig))
    ?~  goo  `~
    %+  both
      ?^(i.goo i.goo ?~(pag ~ `u=i.pag))
    $(goo t.goo, pag ?~(pag ~ t.pag))
  ::
  ++  poor
    %+  sear  posh
    ;~  plug
      (stag ~ gash)
      ;~(pose (stag ~ ;~(pfix cen porc)) (easy ~))
    ==
  ::
  ++  porc
    ;~  plug
      (cook |=(a/(list) (lent a)) (star cen))
      ;~(pfix fas gash)
    ==
  ::
  ++  rump
    %+  sear
      |=  {a/wing b/(unit twig)}  ^-  (unit twig)
      ?~(b [~ %wing a] ?.(?=({@ $~} a) ~ [~ [%rock %tas i.a] u.b]))
    ;~(plug rope ;~(pose (stag ~ ;~(pfix lus wide)) (easy ~)))
  ::
  ++  rood
    ;~  pfix  fas
      (stag %conl poor)
    ==
  ::
  ++  rupl
    %+  cook
      |=  {a/? b/(list twig) c/?}
      ?:  a
        ?:  c
          [%conl [%conl b] ~]
        [%conl b]
      ?:  c
        [%conl [%conp b] ~]
      [%conp b]
    ;~  plug
      ;~  pose
        (cold | (just '['))
        (cold & (jest '~['))
      ==
    ::
      ;~  pose
        (ifix [ace gap] (most gap tall))
        (most ace wide)
      ==
    ::
      ;~  pose
        (cold & (jest ']~'))
        (cold | (just ']'))
      ==
    ==
  ::
  ::
  ++  cram                                              ::  parse unmark
    =>  |%
        ++  item  (pair mite marl:twig)                 ::  xml node generator
        ++  colm  @ud                                   ::  column
        ++  tarp  marl:twig                             ::  node or generator
        ++  mite                                        ::  context
          $?  $down                                     ::  outer embed
              $lunt                                     ::  unordered list
              $lime                                     ::  list item
              $lord                                     ::  ordered list
              $poem                                     ::  verse
              $bloc                                     ::  blockquote
              $head                                     ::  heading
          ==                                            ::
        ++  trig                                        ::  line style
          $:  col/@ud                                   ::  start column
              sty/trig-style                            ::  style
          ==                                            ::
        ++  trig-style                                  ::  type of parsed line
          $%  $:  $end                                  ::  terminator
              $?  $done                                 ::    end of input
                  $stet                                 ::    == end of markdown
                  $dent                                 ::    outdent
              ==  ==                                    ::
              $:  $one                                  ::  leaf node
              $?  $rule                                 ::    --- horz rule
                  $fens                                 ::    ``` code fence
                  $expr                                 ::    ;sail expression
              ==  ==                                    ::
              {$new p/trig-new}                         ::  open container 
              {$old $text}                              ::  anything else
          ==                                            ::
        ++  trig-new                                    ::  start a
          $?  $lite                                     ::    + line item
              $lint                                     ::    - line item
              $head                                     ::    # heading
              $bloc                                     ::    > block-quote
              $poem                                     ::    [ ]{8} poem
          ==                                            ::
        ++  graf                                        ::  paragraph element
          $%  {$bold p/(list graf)}                     ::  *bold*
              {$talc p/(list graf)}                     ::  _italics_
              {$quod p/(list graf)}                     ::  "double quote"
              {$code p/tape}                            ::  code literal
              {$text p/tape}                            ::  text symbol
              {$link p/(list graf) q/tape}              ::  URL
              {$expr p/tuna:twig}                       ::  interpolated hoon
          ==
        --
    =<  (non-empty:parse |=(nail `(like tarp)`~($ main +<)))
    |%
    ++  main
      ::
      ::  state of the parsing loop.  we maintain a construction
      ::  stack for elements and a line stack for lines in the
      ::  current block.  a blank line causes the current block
      ::  to be parsed and thrown in the current element.  when
      ::  the indent column retreats, the element stack rolls up.
      ::
      ::  verbose: debug printing enabled
      ::  err: error position
      ::  ind: outer and inner indent level
      ::  hac: stack of items under construction
      ::  cur: current item under construction
      ::  par: current "paragraph" being read in
      ::  [loc txt]: parsing state
      ::
      =/  verbose  &
      =|  err/(unit hair)
      =|  ind/{out/@ud inr/@ud}
      =|  hac/(list item)
      =/  cur/item  [%down ~]
      =|  par/(unit (pair hair wall))
      |_  {loc/hair txt/tape}
      ::
      ++  $                                             ::  resolve
        ^-  (like tarp)
        =>  line
        ::
        ::  if error position is set, produce error
        ?.  =(~ err)
          ~&  err+err
          [+.err ~]
        ::
        ::  all data was consumed
        =-  [loc `[- [loc txt]]]
        =>  close-par
        |-  ^-  tarp
        ::
        ::  fold all the way to top
        ?~  hac  cur-to-tarp
        $(..^$ close-item)
      ::
      ::+|
      ::
      ++  cur-indent
        ?-  p.cur
          $down  2
          $head  0
          $lunt  0
          $lime  2
          $lord  0
          $poem  8
          $bloc  2
        ==
      ::
      ++  back                                          ::  column retreat
        |=  luc/@ud
        ^+  +>
        ?:  (gte luc inr.ind)  +>
        ::
        ::  nex: next backward step that terminates this context
        =/  nex/@ud  cur-indent  ::REVIEW code and poem blocks are handled elsewhere
        ?:  (gth nex (sub inr.ind luc))
          ::
          ::  indenting pattern violation
          ~?  verbose  indent-pattern-violation+[p.cur nex inr.ind luc]
          ..^$(inr.ind luc, err `[p.loc luc])
        =.  ..^$  close-item
        $(inr.ind (sub inr.ind nex))
      ::
      ++  cur-to-tarp                                   ::  item to tarp
        ^-  tarp
        ?:  ?=(?($down $head $expr) p.cur)
          (flop q.cur)
        =-  [[- ~] (flop q.cur)]~
        ?-  p.cur
          $lunt  %ul
          $lord  %ol
          $lime  %li
          $poem  %div ::REVIEW actual container element?
          $bloc  %blockquote
        ==
      ::
      ++  close-item  ^+  .                             ::  complete and pop
        ?~  hac  .
        %=  .
          hac  t.hac
          cur  [p.i.hac (weld cur-to-tarp q.i.hac)]
        ==
      ::
      ++  read-line                                     ::  capture raw line
        =|  lin/tape
        |-  ^+  [[lin *(unit _err)] +<.^$]  :: parsed tape and halt/error
        ::
        ::  no unterminated lines
        ?~  txt
          ~?  verbose  %unterminated-line
          [[~ ``loc] +<.^$]
        ?.  =(`@`10 i.txt)
          ?:  (gth inr.ind q.loc)
            ?.  =(' ' i.txt)
              ~?  verbose  expected-indent+[inr.ind loc txt]
              [[~ ``loc] +<.^$]
            $(txt t.txt, q.loc +(q.loc))
          ::
          ::  save byte and repeat
          $(txt t.txt, q.loc +(q.loc), lin [i.txt lin])
        =.  lin
          ::
          ::  trim trailing spaces
          |-  ^-  tape
          ?:  ?=({$' ' *} lin)
            $(lin t.lin)
          (flop lin)
        ::
        =/  eat-newline/nail  [[+(p.loc) 1] t.txt]
        =/  saw  look(+<.$ eat-newline)
        ::
        ?:  ?=({$~ @ $end ?($stet $dent)} saw)          ::  stop on == or dedent
          [[lin `~] +<.^$]
        [[lin ~] eat-newline]
      ::
      ++  look                                          ::  inspect line
        ^-  (unit trig)
        %+  bind  (wonk (look:parse loc txt))
        |=  a/trig  ^+  a
        ::
        ::  treat a non-terminator as a terminator
        ::  if it's outdented
        ?:  =(%end -.sty.a)  a
        ?:  (lth col.a out.ind)
          a(sty [%end %dent])
        a
      ::
      ++  close-par                                     ::  make block
        ^+  .
        ::
        ::  empty block, no action
        ?~  par  .
        ::
        ::  if block is verse
        ?:  ?=($poem p.cur)
          ::
          ::  add break between stanzas
          =.  q.cur  ?~(q.cur q.cur [[[%br ~] ~] q.cur])
          =-  close-item(par ~, q.cur (weld - q.cur), inr.ind (sub inr.ind 8))
          %+  turn  q.u.par
          |=  tape  ^-  manx
          ::
          ::  each line is a paragraph
          :-  [%p ~]
          :_  ~
          ;/("{+<}\0a")
        ::
        ::  yex: block recomposed, with newlines
        =/  yex/tape
          (zing (turn (flop q.u.par) |=(a/tape (runt [(dec inr.ind) ' '] "{a}\0a"))))
        ::
        ::  vex: parse of paragraph
        =/  vex/(like tarp)
          ::
          ::  either a one-line header or a paragraph
          %.  [p.u.par yex]
          ?:  ?=($head p.cur)
            (full head:parse)
          (full para:parse)
        ::
        ::  if error, propagate correctly
        ?~  q.vex
          ~?  verbose  [%close-par p.cur yex]
          ..$(err `p.vex)
        ::
        ::  finish tag if it's a header
        =<  ?:(?=($head p.cur) close-item ..$)
        ::
        ::  save good result, clear buffer
        ..$(par ~, q.cur (weld p.u.q.vex q.cur))
      ::
      ++  line  ^+  .                                   ::  body line loop
        ::
        ::  abort after first error
        ?:  !=(~ err)  .
        ::
        ::  saw: profile of this line
        =/  saw  look
        ~?  [debug=|]  [%look ind=ind saw=saw txt=txt]
        ::
        ::  if line is blank
        ?~  saw
          ::
          ::  break section
          =^  a/{tape fin/(unit _err)}  +<.$  read-line
          ?^  fin.a
            ..$(err u.fin.a)
          =>(close-par line)
        ::
        ::  line is not blank
        =>  .(saw u.saw)
        ::
        ::  if end of input, complete
        ?:  ?=($end -.sty.saw)
          ..$(q.loc col.saw)
        ::
        =.  ind  ?~(out.ind [col.saw col.saw] ind)      ::  init indents
        ::
        ?:  ?|  ?=($~ par)                          :: if after a paragraph or
                ?&  ?=(?($down $lime $bloc) p.cur)  :: unspaced new container
                    |(!=(%old -.sty.saw) (gth col.saw inr.ind))
            ==  ==
          =>  .(..$ close-par)
          ::
          ::  if column has retreated, adjust stack
          =.  ..$  (back col.saw)
          ::
          =^  col-ok  sty.saw
            ?+  (sub col.saw inr.ind)  [| sty.saw]        :: columns advanced
              $0  [& sty.saw]
              $8  [& %new %poem]
            ==
          ?.  col-ok
            ~?  verbose  [%columns-advanced col.saw inr.ind]
            ..$(err `[p.loc col.saw])
          ::
          =.  inr.ind  col.saw
          ::
          ::  unless adding a matching item, close lists
          =.  ..$
            ?:  ?|  &(?=($lunt p.cur) !?=($lint +.sty.saw))
                    &(?=($lord p.cur) !?=($lite +.sty.saw))
                ==
              close-item
            ..$
          ::
          =<  line(par `[loc ~])  ^+  ..$               ::  continue with para
          ?-    -.sty.saw
              $one  (read-one +.sty.saw)                ::  parse leaves
              $new  (open-item p.sty.saw)               ::  open containers
              $old  ..$                                 ::  just text
          ==
        ::
        ::
        ::- - - foo
        ::  detect bad block structure
        ?.  ::  first line of container is legal
            ?~  q.u.par  &
            ?-  p.cur
            ::
            ::  can't(/directly) contain text
              ?($lord $lunt)  ~|(bad-leaf-container+p.cur !!)
            ::
            ::  only one line in a header
              $head  |
            ::
            ::  indented literals need to end with a blank line
              $poem  (gte col.saw inr.ind)
            ::
            ::  text tarps must continue aligned
              ?($down $lunt $lime $lord $bloc)  =(col.saw inr.ind)
            ==
          ~?  verbose  bad-block-structure+[p.cur inr.ind col.saw]
          ..$(err `[p.loc col.saw])
        ::
        ::  accept line and maybe continue
        =^  a/{lin/tape fin/(unit _err)}  +<.$  read-line
        =.  par  par(q.u [lin.a q.u.par])
        ?^  fin.a  ..$(err u.fin.a)
        line
      ::
      ++  parse-block                                   ::  execute parser
        |=  fel/$-(nail (like tarp))  ^+  +>
        =/  vex/(like tarp)  (fel loc txt)
        ?~  q.vex
          ~?  verbose  [%parse-block txt]
          +>.$(err `p.vex)
        =+  [res loc txt]=u.q.vex
        %_  +>.$
          loc  loc
          txt  txt
          q.cur  (weld (flop `tarp`res) q.cur)          ::  prepend to the stack
        ==
      ::
      ++  read-one                                      ::  read %one item
        |=  sty/?($expr $rule $fens)  ^+  +>
        ?-  sty
          $expr  (parse-block expr:parse)
          $rule  (parse-block hrul:parse)
          $fens  (parse-block (fens:parse inr.ind))
        ==
      ::
      ++  open-item                                     ::  enter list/quote
        |=  saw/trig-new
        =<  +>.$:apex
        |%
        ++  apex  ^+  .                                 ::  open container
          ?-  saw
            $poem  (push %poem)                         ::  verse literal
            $head  (push %head)                         ::  heading
            $bloc  (entr %bloc)                         ::  blockquote line
            $lint  (lent %lunt)                         ::  unordered list
            $lite  (lent %lord)                         ::  ordered list
          ==
        ::
        ++  push                                        ::  push context
          |=(mite +>(hac [cur hac], cur [+< ~]))
        ::
        ++  entr                                        ::  enter container
          |=  typ/mite
          ^+  +>
          ::
          ::  indent by 2
          =.  inr.ind  (add 2 inr.ind)
          ::
          ::  "parse" marker
          =.  txt  (slag (sub inr.ind q.loc) txt)
          =.  q.loc  inr.ind
          ::
          (push typ)
        ::
        ++  lent                                        ::  list entry
          |=  ord/?($lord $lunt)
          ^+  +>
          =>  ?:(=(ord p.cur) +>.$ (push ord))          ::  push list if new 
          (entr %lime)
        --
      --
    ::
    ++  parse                                           ::  individual parsers
      |%
      ++  look                                          ::  classify line
        %+  cook  |=(a/(unit trig) a)
        ;~  pfix  (star ace)
          %+  here                                      ::  report indent
            |=({a/pint b/?($~ trig-style)} ?~(b ~ `[q.p.a b]))
          ;~  pose
            (cold ~ (just `@`10))                       ::  blank line
          ::
            (full (easy [%end %done]))                  ::  end of input
            (cold [%end %stet] duz)                     ::  == end of markdown
          ::
            (cold [%one %rule] ;~(plug hep hep hep))    ::  --- horizontal ruler
            (cold [%one %fens] ;~(plug tec tec tec))    ::  ``` code fence
            (cold [%one %expr] sem)                     ::  ;sail expression
          ::
            (cold [%new %head] ;~(plug (star hax) ace)) ::  # heading
            (cold [%new %lint] ;~(plug hep ace))        ::  - line item
            (cold [%new %lite] ;~(plug lus ace))        ::  + line item
            (cold [%new %bloc] ;~(plug gar ace))        ::  > block-quote
          ::
            (easy [%old %text])                         ::  anything else
          ==
        ==
      ::
      ::
      ++  cash                                          ::  escaped fence
        |*  tem/rule
        %-  echo
        %-  star
        ;~  pose
          whit
          ;~(plug bas tem)
          ;~(less tem prn)
        ==
      ::
      ++  cool                                          ::  reparse
        |*  $:  ::  fex: primary parser
                ::  sab: secondary parser
                ::
                fex/rule
                sab/rule
            ==
        |=  {loc/hair txt/tape}
        ^+  *sab
        ::
        ::  vex: fenced span
        =/  vex/(like tape)  (fex loc txt)
        ?~  q.vex  vex
        ::
        ::  hav: reparse full fenced text
        =/  hav  ((full sab) [loc p.u.q.vex])
        ::
        ::  reparsed error position is always at start
        ?~  q.hav  [loc ~]
        ::
        ::  the complete span with the main product
        :-  p.vex
        `[p.u.q.hav q.u.q.vex]
      ::
      ::REVIEW surely there is a less hacky "first or after space" solution
      ++  easy-sol                                      ::  parse start of line
        |*  a/*
        |=  b/nail
        ?:  =(1 q.p.b)  ((easy a) b)
        (fail b)
      ::
      ++  echo                                          ::  hoon literal
        |*  sab/rule
        |=  {loc/hair txt/tape}
        ^-  (like tape)
        ::
        ::  vex: result of parsing wide twig
        =/  vex  (sab loc txt)
        ::
        ::  use result of expression parser
        ?~  q.vex  vex
        =-  [p.vex `[- q.u.q.vex]]
        ::
        ::  but replace payload with bytes consumed
        |-  ^-  tape
        ?:  =(q.q.u.q.vex txt)  ~
        ?~  txt  ~
        [i.txt $(txt +.txt)]
      ::
      ++  non-empty
        |*  a/rule
        |=  tub/nail  ^+  (a)
        =/  vex  (a tub)
        ~!  vex
        ?~  q.vex  vex
        ?.  =(tub q.u.q.vex)  vex
        (fail tub)
      ::
      ::
      ++  word                                          ::  tarp parser
        %+  knee  *(list graf)  |.  ~+
        %+  cook  |=(a/?(graf (list graf)) ?+(a a {@ *} [a]~))
        ;~  pose
        ::
        ::  ordinary word
        ::
          %+  stag  %text
          ;~(plug ;~(pose low hig) (star ;~(pose nud low hig hep)))
        ::
        ::  naked \escape
        ::
          (stag %text ;~(pfix bas (cook trip ;~(less ace prn))))
        ::
        ::  trailing \ to add <br>
        ::
          (stag %expr (cold [[%br ~] ~] ;~(plug bas (just '\0a'))))
        ::
        ::  *bold literal*
        ::
          (stag %bold (ifix [tar tar] (cool (cash tar) work)))
        ::
        ::  _italic literal_
        ::
          (stag %talc (ifix [cab cab] (cool (cash cab) work)))
        ::
        ::  "quoted text"
        ::
          (stag %quod (ifix [doq doq] (cool (cash doq) work)))
        ::
        ::  `classic markdown quote`
        ::
          (stag %code (ifix [tec tec] (cash tec)))
        ::
        ::  ++arm
        ::
          (stag %code ;~(plug lus lus low (star ;~(pose nud low hep))))
        ::
        ::  [arbitrary *content*](url)
        ::
          %+  stag  %link
          ;~  (glue (punt whit))
            (ifix [sel ser] (cool (cash ser) work))
            (ifix [pel per] (cash per))
          ==
        ::
        ::  #twig
        ::
          ;~  plug
            (stag %text ;~(pose (cold " " whit) (easy-sol ~)))
            (stag %code ;~(pfix hax (echo wide)))
            ;~(simu whit (easy ~))
          ==
        ::
        ::  direct hoon constant
        ::
          ;~  plug
            (stag %text ;~(pose (cold " " whit) (easy-sol ~)))
          ::
            %+  stag  %code
            %-  echo
            ;~  pose
              ::REVIEW just copy in 0x... parsers directly?
              ;~(simu ;~(plug (just '0') alp) bisk:so)
            ::
              tash:so
              ;~(pfix dot perd:so)
              ;~(pfix sig ;~(pose twid:so (easy [%$ %n 0])))
              ;~(pfix cen ;~(pose sym buc pam bar qut nuck:so))
            ==
          ::
            ;~(simu whit (easy ~))
          ==
        ::
        ::  whitespace
        ::
          (stag %text (cold " " whit))
        ::
        ::  {interpolated} sail
        ::
          (stag %expr inline-embed:(sail |))
        ::
        ::  just a byte
        ::
          (stag %text (cook trip ;~(less ace prn)))
        ==
      ::
      ++  work  (cook zing (star word))                 ::  indefinite tarp
      ::
      ++  down                                          ::  parse inline tarp
        %+  knee  *tarp  |.  ~+
        =-  (cook - work)
        ::
        ::  collect raw tarp into xml tags
        |=  gaf/(list graf)
        ^-  tarp
        =<  main
        |%
        ++  main
          ^-  tarp
          ?~  gaf  ~
          ?.  ?=($text -.i.gaf)
            (weld (item i.gaf) $(gaf t.gaf))
          ::
          ::  fip: accumulate text blocks
          =/  fip/(list tape)  [p.i.gaf]~
          |-  ^-  tarp
          ?~  t.gaf  [;/((zing (flop fip))) ~]
          ?.  ?=($text -.i.t.gaf)
            [;/((zing (flop fip))) ^$(gaf t.gaf)]
          $(gaf t.gaf, fip :_(fip p.i.t.gaf))
        ::
        ++  item
          |=  nex/graf
          ^-  tarp  ::CHECK can be tuna:twig?
          ?-  -.nex
            $text  !!  :: handled separately
            $expr  [p.nex]~
            $bold  [[%b ~] ^$(gaf p.nex)]~
            $talc  [[%i ~] ^$(gaf p.nex)]~
            $code  [[%code ~] ;/(p.nex) ~]~
            $quod  ::
                   ::  smart quotes
                   %=    ^$
                       gaf
                     :-  [%text (tufa ~-~201c. ~)]
                     %+  weld  p.nex
                     `(list graf)`[%text (tufa ~-~201d. ~)]~
                   ==
            $link  [[%a [%href q.nex] ~] ^$(gaf p.nex)]~
          ==
        --
      ::
      ++  hrul                                          ::  empty besides fence
        %+  cold  [[%hr ~] ~]~
        ;~(plug (star ace) hep hep hep (star hep) (just '\0a'))
      ::
      ++  tecs
        ;~(plug tec tec tec (just '\0a'))
      ::
      ++  fens
        |=  col/@u  ~+
        =/  ind  (stun [(dec col) (dec col)] ace)
        =/  ind-tecs  ;~(plug ind tecs)
        %+  cook  |=(txt/tape `tarp`[[%pre ~] ;/(txt) ~]~)
        ::
        ::  leading outdent is ok since container may
        ::  have already been parsed and consumed
        %+  ifix  [;~(plug (star ace) tecs) ind-tecs]
        %^  stir  ""  |=({a/tape b/tape} "{a}\0a{b}")
        ;~  pose
          %+  ifix  [ind (just '\0a')]
          ;~(less tecs (star prn))
        ::
          (cold "" ;~(plug (star ace) (just '\0a')))
        ==
      ::
      ++  para                                          ::  paragraph
        %+  cook
          |=(a/tarp ?~(a ~ [[%p ~] a]~))
        ;~(pfix (punt whit) down)
      ::
      ++  expr                                          ::  expression
        =>  (sail &)                                    ::  tall-form
        %+  ifix  [(star ace) ;~(simu gap (easy))]      ::  look-ahead for gap
        (cook drop-top top-level)                       ::  list of tags
        ::
      ::
      ++  whit                                          ::  whitespace
        (cold ' ' (plus ;~(pose (just ' ') (just '\0a'))))
      ::
      ++  head                                          ::  parse heading
        %+  cook
          |=  {haxes/tape kids/tarp}  ^-  tarp
          =/  tag  (crip 'h' <(lent haxes)>)            ::  e.g. ### -> %h3
          =/  id  (contents-to-id kids)
          [[tag [%id id]~] kids]~
        ::
        ;~(pfix (star ace) ;~((glue whit) (stun [1 6] hax) down))
      ::
      ++  contents-to-id                                ::  # text into elem id
        |=  a/(list tuna:twig)  ^-  tape
        =;  raw/tape
          %+  turn  raw
          |=  @tD
          ^-  @tD
          ?:  ?|  &((gte +< 'a') (lte +< 'z'))
                  &((gte +< '0') (lte +< '9'))
              ==
            +<
          ?:  &((gte +< 'A') (lte +< 'Z'))
            (add 32 +<)
          '-'
        ::
        ::  collect all text in header tarp
        |-  ^-  tape
        ?~  a  ~
        %+  weld
          ^-  tape
          ?-    i.a
              {{$$ {$$ *} $~} $~}                       ::  text node contents
            (murn v.i.a.g.i.a |=(a/beer ?^(a ~ (some a))))
              {^ *}  $(a c.i.a)                         ::  concatenate children
              {@ *}  ~                                  ::  ignore interpolation
          ==
        $(a t.a)
      --
    --
  ++  sail                                              ::  xml template
    |=  in-tall-form/?  =|  lin/?
    |%
    ::
    ++  apex                                            ::  product twig
      %+  cook
        |=  tum/(each manx marl):twig  ^-  twig
        ?-  -.tum
          $&  [%xmn p.tum]
          $|  [%xml p.tum]
        ==
      top-level
    ::
    ++  top-level                                        ::  entry-point
      ;~(pfix sem ?:(in-tall-form tall-top wide-top))
    ::
    ++  inline-embed                                    ::  brace interpolation
      %+  cook  |=(a/tuna:twig a)
      ;~  pose
        ;~(pfix sem bracketed-elem(in-tall-form |))
        ;~(plug tuna-mode sump)
        (stag %tape sump)
      ==
    ::
    ++  script-or-style                                 ::  script or style
      %+  cook  |=(a/marx:twig a)
      ;~  plug
        ;~(pose (jest %script) (jest %style))
        wide-attrs
      ==
    ::
    ++  tuna-mode                                       ::  xml node(s) kind
      ;~  pose
        (cold %tape hep)
        (cold %manx lus)
        (cold %marl tar)
        (cold %call cen)
      ==
    ::
    ++  wide-top                                        ::  wide outer top
      %+  knee  *(each manx marl):twig  |.  ~+
      ;~  pose
        (stag %| wide-quote)
        (stag %| wide-paren-elems)
        (stag %& ;~(plug tag-head wide-tail))
      ==
    ::
    ++  wide-inner-top                                  ::  wide inner top
      %+  knee  *(each tuna marl):twig  |.  ~+
      ;~  pose
        wide-top
        (stag %& ;~(plug tuna-mode wide))
      ==
    ::
    ++  wide-attrs                                      ::  wide attributes
      %+  cook  |=(a/(unit mart:twig) (fall a ~))
      %-  punt
      %+  ifix  [pel per]
      %+  more  (jest ', ')
      ;~((glue ace) a-mane hopefully-quote)
    ::
    ++  wide-tail                                       ::  wide elements
      %+  cook  |=(a/marl:twig a)
      ;~(pose ;~(pfix col wrapped-elems) (cold ~ sem) (easy ~))
    ::
    ++  wide-elems                                      ::  wide elements
      %+  cook  |=(a/marl:twig a)
      %+  cook  join-tops
      (star ;~(pfix ace wide-inner-top))
    ::
    ++  wide-paren-elems                                ::  wide flow
      %+  cook  |=(a/marl:twig a)
      %+  cook  join-tops
      (ifix [pel per] (more ace wide-inner-top))
    ::
    ::+|
    ::
    ++  drop-top
      |=  a/(each tuna marl):twig  ^-  marl:twig
      ?-  -.a
        $&  [p.a]~
        $|  p.a
      ==
    ::
    ++  join-tops
      |=  a/(list (each tuna marl)):twig  ^-  marl:twig
      (zing (turn a drop-top))
    ::
    ::+|
    ::
    ++  wide-quote                                      ::  wide quote
      %+  cook  |=(a/marl:twig a)
      ;~  pose
        ;~  less  (jest '"""')
          (ifix [doq doq] (cook collapse-chars quote-innards))
        ==
      ::
        %-  inde
        %+  ifix  [(jest '"""\0a') (jest '\0a"""')]
        (cook collapse-chars quote-innards(lin |))
      ==
    ::
    ++  quote-innards                                   ::  wide+tall flow
      %+  cook  |=(a/(list $@(@ tuna:twig)) a)
      %-  star
      ;~  pose
        ;~(pfix bas ;~(pose (mask "-+*%;\{") bas doq bix:ab))
        inline-embed
        ;~(less bas kel ?:(in-tall-form fail doq) prn)
        ?:(lin fail ;~(less (jest '\0a"""') (just '\0a')))
      ==
    ::
    ++  bracketed-elem                                  ::  bracketed element
      %+  ifix  [kel ker]
      ;~(plug tag-head wide-elems)
    ::
    ++  wrapped-elems                                   ::  wrapped tuna
      %+  cook  |=(a/marl:twig a)
      ;~  pose
        wide-paren-elems
        (cook |=(@t `marl`[;/((trip +<))]~) qut)
        (cook drop-top wide-top)
      ==
    ::
    ::+|
    ::
    ++  a-mane                                          ::  mane as twig
      %+  cook
        |=  {a/@tas b/(unit @tas)}
        ?~(b a [a u.b])
      ;~(plug sym ;~(pose (stag ~ ;~(pfix cab sym)) (easy ~)))
    ::
    ++  en-class
      |=  a/(list {$class p/term})
      ^-  (unit {$class tape})
      ?~  a  ~
      %-  some
      :-  %class
      |-
      %+  welp  (trip p.i.a)
      ?~  t.a  ~
      [' ' $(a t.a)]
    ::
    ++  tag-head                                        ::  tag head
      %+  cook
        =+  twig  ::REVIEW rename dynamic xml types
        |=  {a/mane b/mart c/mart}
        ^-  marx
        [a (weld b c)]
      ;~  plug
        a-mane
      ::
        %+  cook
          |=  a/(list (unit {term (list beer)}))
          ^-  (list {term (list beer)})
          :: discard nulls
          (murn a same)
        ;~  plug
          (punt ;~(plug (cold %id hax) (cook trip sym)))
          (cook en-class (star ;~(plug (cold %class dot) sym)))
          (punt ;~(plug ;~(pose (cold %href fas) (cold %src pat)) soil))
          (easy ~)
        ==
      ::
        wide-attrs
      ==
    ::
    ::+|
    ::
    ++  tall-top                                        ::  tall top
      %+  knee  *(each manx marl):twig  |.  ~+
      ;~  pose
        (stag %| ;~(pfix (plus ace) (cook collapse-chars quote-innards)))
        (stag %& ;~(plug script-or-style script-style-tail))
        (stag %& tall-elem)
        (stag %| wide-quote)
        (stag %| ;~(pfix tis tall-tail))
        (stag %& ;~(pfix gar gap (stag [%div ~] cram)))
        (stag %| ;~(plug ;~((glue gap) tuna-mode tall) (easy ~)))
        (easy %| [;/("\0a")]~)
      ==
    ::
    ++  tall-attrs                                      ::  tall attributes
      %-  star
      ;~  pfix  ;~(plug gap tis)
        ;~((glue gap) a-mane hopefully-quote)
      ==
    ::
    ++  tall-elem                                       ::  tall preface
      %+  cook
        =+  twig  ::REVIEW rename dynamic xml types
        |=  {a/{p/mane q/mart} b/mart c/marl}
        ^-  manx
        [[p.a (weld q.a b)] c]
      ;~(plug tag-head tall-attrs tall-tail)
    ::
    ::+|
    ::
    ::REVIEW is there a better way to do this?
    ++  hopefully-quote                                 :: prefer "quote" form
      %+  cook  |=(a/(list beer) a)
      %+  cook  |=(a/twig ?:(?=($knit -.a) p.a [~ a]~))
      wide
    ::
    ++  script-style-tail                               ::  unescaped tall tail
      %+  cook  |=(a/marl:twig a)
      %+  ifix  [gap ;~(plug gap duz)]
      %+  most  gap
      ;~  pfix  sem
        %+  cook  |=(a/tape ;/(a))
        ;~  pose
          ;~(pfix ace (star prn))
          (easy "\0a")
        ==
      ==
    ::
    ++  tall-tail                                       ::  tall tail
      ?>  in-tall-form
      %+  cook  |=(a/marl:twig a)
      ;~  pose
        (cold ~ sem)
        ;~(pfix col wrapped-elems(in-tall-form |))
        ;~(pfix col ace (cook collapse-chars(in-tall-form |) quote-innards))
        (ifix [gap ;~(plug gap duz)] tall-kids)
      ==
    ::
    ++  tall-kids                                       ::  child elements
      %+  cook  join-tops
      ::  look for sail first, or markdown if not
      (most gap ;~(pose top-level (stag %| cram)))
    ::
    ++  collapse-chars                                  ::  group consec chars
      |=  reb/(list $@(@ tuna:twig))
      ^-  marl:twig
      =|  {sim/(list @) tuz/marl:twig}
      |-  ^-  marl:twig
      ?~  reb
        =.  sim
          ?.  in-tall-form   sim
          [10 |-(?~(sim sim ?:(=(32 i.sim) $(sim t.sim) sim)))]
        ?~(sim tuz [;/((flop sim)) tuz])
      ?@  i.reb
        $(reb t.reb, sim [i.reb sim])
      ?~  sim  [i.reb $(reb t.reb, sim ~)]
      [;/((flop sim)) i.reb $(reb t.reb, sim ~)]
    --
  ::
  ++  scat  !:
    %+  knee  *twig  |.  ~+
    %-  stew
    ^.  stet  ^.  limo
    :~
      :-  ','
        ;~  pose
          (stag %wing rope)
          ;~(pfix com (stag %burn wide))
        ==
      :-  '!'
        ;~  pose
          (stag %not ;~(pfix zap wide))
          (stag %fail (cold ~ ;~(plug zap zap)))
        ==
      :-  '_'
        ;~(pfix cab (stag %shoe wide))
      :-  '$'
        ;~  pose
          ;~  pfix  buc
            ;~  pose
              (stag %leaf (stag %tas (cold %$ buc)))
              (stag %leaf (stag %f (cold & pam)))
              (stag %leaf (stag %f (cold | bar)))
              (stag %leaf (stag %t qut))
              (stag %leaf (sear |=(a/coin ?:(?=($$ -.a) (some +.a) ~)) nuck:so))
            ==
          ==
          rump
        ==
      :-  '%'
        ;~  pfix  cen
          ;~  pose
            (stag %conl (sear |~({a/@ud b/tyke} (posh ~ ~ a b)) porc))
            (stag %rock (stag %tas (cold %$ buc)))
            (stag %rock (stag %f (cold & pam)))
            (stag %rock (stag %f (cold | bar)))
            (stag %rock (stag %t qut))
            (cook (jock &) nuck:so)
            (stag %conl (sear |=(a/(list) (posh ~ ~ (lent a) ~)) (star cen)))
          ==
        ==
      :-  '&'
        ;~  pose
          (cook |=(a/wing [%make a ~]) rope)
          (stag %and ;~(pfix pam (ifix [pel per] (most ace wide))))
          ;~(plug (stag %rock (stag %f (cold & pam))) ;~(pfix lus wide))
          (stag %sand (stag %f (cold & pam)))
        ==
      :-  '\''
        (stag %sand (stag %t qut))
      :-  '('
        (stag %call (ifix [pel per] (most ace wide)))
      :-  '{'
        (stag %bank (ifix [kel ker] (most ace wide)))
      :-  '*'
        ;~  pose
          (stag %bunt ;~(pfix tar wide))
          (cold [%base %noun] tar)
        ==
      :-  '@'
        ;~(pfix pat (stag %base (stag %atom mota)))
      :-  '+'
        ;~  pose
          (stag %bump ;~(pfix lus (ifix [pel per] wide)))
        ::
          %+  cook
            |=  a/(list (list beer))
            :-  %nub
            [%knit |-(^-((list beer) ?~(a ~ (weld i.a $(a t.a)))))]
          (most dog ;~(pfix lus soil))
        ::
          (cook |=(a/wing [%make a ~]) rope)
        ==
      :-  '-'
        ;~  pose
          (stag %sand tash:so)
        ::
          %+  cook
            |=  a/(list (list beer))
            [%conl (phax a)]
          (most dog ;~(pfix hep soil))
        ::
          (cook |=(a/wing [%make a ~]) rope)
        ==
      :-  '.'
        ;~  pose
          (cook (jock |) ;~(pfix dot perd:so))
          (cook |=(a/wing [%make a ~]) rope)
        ==
      :-  ['0' '9']
        %+  cook
          |=  {a/dime b/(unit twig)}
          ?~(b [%sand a] [[%rock a] u.b])
        ;~(plug bisk:so (punt ;~(pfix lus wide)))
      :-  ':'
        ;~  pfix  col
          ;~  pose
            (stag %wad (ifix [pel per] (most ace wide)))
            ;~(pfix fas (stag %nub wide))
          ==
        ==
      :-  '='
        (stag %same ;~(pfix tis (ifix [pel per] ;~(glam wide wide))))
      :-  '?'
        ;~  pose
          (stag %pick ;~(pfix wut (ifix [pel per] (most ace wide))))
          (cold [%base %bean] wut)
        ==
      :-  '['
        rupl
      :-  '^'
        ;~  pose
          (stag %wing rope)
          (cold [%base %cell] ket)
        ==
      :-  '`'
        ;~  pfix  tec
          ;~  pose
            %+  cook
              |=({a/@ta b/twig} [%like [%sand a 0] [%like [%sand %$ 0] b]])
            ;~(pfix pat ;~(plug mota ;~(pfix tec wide)))
            ;~  pfix  tar
              (stag %cast (stag [%base %noun] ;~(pfix tec wide)))
            ==
            (stag %cast ;~(plug wide ;~(pfix tec wide)))
            (stag %like ;~(pfix lus ;~(plug wide ;~(pfix tec wide))))
            (cook |=(a/twig [[%rock %n ~] a]) wide)
          ==
        ==
      :-  '"'
        %+  cook
          |=  a/(list (list beer))
          [%knit |-(^-((list beer) ?~(a ~ (weld i.a $(a t.a)))))]
        (most dog soil)
      :-  ['a' 'z']
        rump
      :-  '|'
        ;~  pose
          (cook |=(a/wing [%make a ~]) rope)
          (stag %or ;~(pfix bar (ifix [pel per] (most ace wide))))
          ;~(plug (stag %rock (stag %f (cold | bar))) ;~(pfix lus wide))
          (stag %sand (stag %f (cold | bar)))
        ==
      :-  '~'
        ;~  pose
          rupl
        ::
          ;~  pfix  sig
            ;~  pose
              (stag %conl (ifix [sel ser] (most ace wide)))
            ::
              %+  stag  %open
              %+  ifix
                [pel per]
              ;~(glam rope wide (most ace wide))
            ::
              (cook (jock |) twid:so)
              (stag [%bust %null] ;~(pfix lus wide))
              (easy [%bust %null])
            ==
          ==
        ==
      :-  '/'
        rood
      :-  '<'
        (ifix [gal gar] (stag %tell (most ace wide)))
      :-  '>'
        (ifix [gar gal] (stag %yell (most ace wide)))
    ==
  ++  soil
    ;~  pose
      ;~  less  (jest '"""')
        %+  ifix  [doq doq]
        %-  star
        ;~  pose
          ;~(pfix bas ;~(pose bas doq kel bix:ab))
          ;~(less doq bas kel prn)
          (stag ~ sump)
        ==
      ==
    ::
      %-  inde  %+  ifix
        [(jest '"""\0a') (jest '\0a"""')]
      %-  star
      ;~  pose
        ;~(pfix bas ;~(pose bas kel bix:ab))
        ;~(less bas kel prn)
        ;~(less (jest '\0a"""') (just `@`10))
        (stag ~ sump)
      ==
    ==
  ++  sump  (ifix [kel ker] (stag %conp (most ace wide)))
  ++  norm                                              ::  rune regular form
    |=  tol/?
    =<  %-  stew
        ^.  stet  ^.  limo
        :~  :-  '|'
              ;~  pfix  bar
                %-  stew
                ^.  stet  ^.  limo
                :~  ['_' (rune cab %door expr)]
                    ['%' (rune cen %core expe)]
                    [':' (rune col %gasp expb)]
                    ['.' (rune dot %trap expa)]
                    ['/' (rune fas %door expr)]
                    ['-' (rune hep %loop expa)]
                    ['^' (rune ket %cork expr)]
                    ['~' (rune sig %port expb)]
                    ['*' (rune tar %gill expb)]
                    ['=' (rune tis %gate expb)]
                    ['?' (rune wut %tray expa)]
                ==
              ==
            :-  '$'
              ;~  pfix  buc
                %-  stew
                ^.  stet  ^.  limo
                :~  ['@' (rune pat %claw expb)]
                    ['_' (rune cab %shoe expa)]
                    [':' (rune col %bank exps)]
                    ['%' (rune cen %book exps)]
                    ['^' (rune ket %bush expb)]
                    ['-' (rune hep %lamb expb)]
                    ['=' (rune tis %coat expg)]
                    ['?' (rune wut %pick exps)]
                ==
              ==
            :-  '%'
              ;~  pfix  cen
                %-  stew
                ^.  stet  ^.  limo
                :~  ['_' (rune cab %keep exph)]
                    ['.' (rune dot %lace expb)]
                    ['^' (rune ket %calq expd)]
                    ['+' (rune lus %calt expc)]
                    ['-' (rune hep %call expk)]
                    ['~' (rune sig %open expu)]
                    ['*' (rune tar %bake expm)]
                    ['=' (rune tis %make exph)]
                ==
              ==
            :-  ':'
              ;~  pfix  col
                ;~  pose
                  %-  stew
                  ^.  stet  ^.  limo
                  :~  ['_' (rune cab %scon expb)]
                      ['^' (rune ket %conq expd)]
                      ['+' (rune lus %cont expc)]
                      ['-' (rune hep %cons expb)]
                      ['~' (rune sig %conl exps)]
                      ['*' (rune tar %conp exps)]
                  ==
                ::
                  (word %door expr)
                  (word %core expe)
                  (word %gasp expb)
                  (word %trap expa)
                  (word %door expr)
                  (word %loop expa)
                  (word %cork expr)
                  (word %port expb)
                  (word %gill expb)
                  (word %gate expb)
                  (word %tray expa)
                ::
                  (word %bunt expa)
                  (word %claw expb)
                  (word %shoe expa)
                  (word %bank exps)
                  (word %book exps)
                  (word %bush expb)
                  (word %lamb expb)
                  (word %coat expg)
                  (word %pick exps)
                ::
                  (word %keep exph)
                  (word %lace expb)
                  (word %calq expd)
                  (word %calt expc)
                  (word %call expk)
                  (word %open expu)
                  (word %bake expm)
                  (word %make exph)
                ::
                  (word %scon expb)
                  (word %conq expd)
                  (word %cont expc)
                  (word %cons expb)
                  (word %conl exps)
                  (word %conp exps)
                ::
                  (word %bump expa)
                  (word %nock expb)
                  (word %same expb)
                  (word %deep expa)
                  (word %wish expn)
                  (word %wish expn)
                ::
                  (word %iron expa)
                  (word %ward expb)
                  (word %cast expb)
                  (word %like expb)
                  (word %zinc expa)
                  (word %burn expa)
                  (word %name expg)
                  (word %lead expa)
                ::
                  (word %show expb)
                  (word %poll expf)
                  (word %lurk expb)
                  (word %fast hind)
                  (word %funk hine)
                  (word %thin hinb)
                  (word %hint hinb)
                  (word %memo hinc)
                  (word %dump hinf)
                  (word %warn hing)
                  (word %ddup expb)
                  (word %peep expb)
                ::
                  (word %wad expi)
                  (word %nub expa)
                  (word %dip expi)
                  (word %fry expb)
                ::
                  (word %new expb)
                  (word %set expq)
                  (word %sip expt)
                  (word %fix expp)
                  (word %rap expb)
                  (word %var expo)
                  (word %rev expo)
                  (word %per expb)
                  (word %nip expb)
                  (word %aka expl)
                  (word %pin expb)
                  (word %tow expi)
                ::
                  (word %or exps)
                  (word %if expc)
                  (word %lest expc)
                  (word %deny expb)
                  (word %sure expb)
                  ;~(pfix (jest %case) (toad tkhp))
                  ;~(pfix (jest %ifcl) (toad tkkt))
                  ;~(pfix (jest %fits) (toad tkts))
                  ;~(pfix (jest %deft) (toad tkls))
                  (word %and exps)
                  ;~(pfix (jest %ifat) (toad tkpt))
                  ;~(pfix (jest %ifno) (toad tksg))
                  (word %not expa)
                ::
                  (word %twig expb)
                  (word %spit expb)
                  (word %wrap expa)
                  (word %code expa)
                  (word %need hinh)
                  moar
                ==
              ==
            :-  '.'
              ;~  pfix  dot
                %-  stew
                ^.  stet  ^.  limo
                :~  ['+' (rune lus %bump expa)]
                    ['*' (rune tar %nock expb)]
                    ['=' (rune tis %same expb)]
                    ['?' (rune wut %deep expa)]
                    ['^' (rune ket %wish expn)]
                ==
              ==
            :-  '^'
              ;~  pfix  ket
                %-  stew
                ^.  stet  ^.  limo
                :~  ['|' (rune bar %iron expa)]
                    ['.' (rune dot %ward expb)]
                    ['-' (rune hep %cast expb)]
                    ['+' (rune lus %like expb)]
                    ['&' (rune pam %zinc expa)]
                    ['~' (rune sig %burn expa)]
                    ['=' (rune tis %name expg)]
                    ['?' (rune wut %lead expa)]
                ==
              ==
            :-  '~'
              ;~  pfix  sig
                %-  stew
                ^.  stet  ^.  limo
                :~  ['|' (rune bar %show expb)]
                    ['$' (rune buc %poll expg)]
                    ['_' (rune cab %lurk expb)]
                    ['%' (rune cen %fast hind)]
                    ['/' (rune fas %funk hine)]
                    ['<' (rune gal %thin hinb)]
                    ['>' (rune gar %hint hinb)]
                    ['+' (rune lus %memo hinc)]
                    ['&' (rune pam %dump hinf)]
                    ['?' (rune wut %warn hing)]
                    ['=' (rune tis %ddup expb)]
                    ['!' (rune zap %peep expb)]
                ==
              ==
            :-  ';'
              ;~  pfix  sem
                %-  stew
                ^.  stet  ^.  limo
                :~  [':' (rune col %wad expi)]
                    ['/' (rune fas %nub expa)]
                    ['~' (rune sig %dip expi)]
                    [';' (rune sem %fry expb)]
                ==
              ==
            :-  '='
              ;~  pfix  tis
                %-  stew
                ^.  stet  ^.  limo
                :~  ['|' (rune bar %new expb)]
                    ['.' (rune dot %set expq)]
                    ['^' (rune ket %sip expt)]
                    [':' (rune col %fix expp)]
                    ['/' (rune fas %var expo)]
                    [';' (rune sem %rev expo)]
                    ['<' (rune gal %rap expb)]
                    ['>' (rune gar %per expb)]
                    ['-' (rune hep %nip expb)]
                    ['*' (rune tar %aka expl)]
                    ['+' (rune lus %pin expb)]
                    ['~' (rune sig %tow expi)]
                ==
              ==
            :-  '?'
              ;~  pfix  wut
                %-  stew
                ^.  stet  ^.  limo
                :~  ['|' (rune bar %or exps)]
                    [':' (rune col %if expc)]
                    ['.' (rune dot %lest expc)]
                    ['<' (rune gal %deny expb)]
                    ['>' (rune gar %sure expb)]
                    ['-' ;~(pfix hep (toad tkhp))]
                    ['^' ;~(pfix ket (toad tkkt))]
                    ['=' ;~(pfix tis (toad tkts))]
                    ['+' ;~(pfix lus (toad tkls))]
                    ['&' (rune pam %and exps)]
                    ['@' ;~(pfix pat (toad tkpt))]
                    ['~' ;~(pfix sig (toad tksg))]
                    ['!' (rune zap %not expa)]
                ==
              ==
            :-  '!'
              ;~  pfix  zap
                %-  stew
                ^.  stet  ^.  limo
                :~  [':' ;~(pfix col (toad expz))]
                    ['.' ;~(pfix dot (toad |.(loaf(bug |))))]
                    [',' (rune com %twig expb)]
                    [';' (rune sem %spit expb)]
                    ['>' (rune gar %wrap expa)]
                    ['=' (rune tis %code expa)]
                    ['?' (rune wut %need hinh)]
                ==
              ==
        ==
    |%
    ++  boog                                            ::  core arms
      %+  knee  [p=*term q=*foot]  |.  ~+
      ;~  pfix  lus
        ;~  pose
          %+  cook
            |=({a/$ash b/term c/twig} [b a c])
          ;~  gunk
            (cold %ash (just '+'))
            ;~(pose (cold %$ buc) sym)
            loaf
          ==
        ::
          %+  cook
            |=({a/$elm b/term c/twig} [b a c])
          ;~  gunk
            (cold %elm (just '-'))
            ;~(pose (cold %$ buc) sym)
            loaf
          ==
        ==
      ==
    ::
    ++  wisp                                            ::  core tail
      %-  ulva
      %+  sear
        |=  a/(list (pair term foot))
        =|  b/(map term foot)
        |-  ^-  (unit _b)
        ?~  a  `b
        ?:  (~(has by b) p.i.a)
          ~&(duplicate-arm+p.i.a ~)
        $(a t.a, b (~(put by b) p.i.a q.i.a))
      (most muck boog)
    ::
    ++  toad                                            ::  untrap parser exp
      |*  har/_expa
      =+  dur=(ifix [pel per] $:har(tol |))
      ?:(tol ;~(pose ;~(pfix gap $:har(tol &)) dur) dur)
    ::
    ++  rune                                            ::  build rune
      |*  {dif/rule tuq/* har/_expa}
      ;~(pfix dif (stag tuq (toad har)))
    ::
    ++  word                                            ::  build keyword
      |*  {key/cord har/_expa}
      ;~(pfix (jest key) (stag key (toad har)))
    ::
    ++  moar                                            ::  :moar hack
      %+  cook
        |=  {a/(list) b/(list (pair wing twig))}
        ^-  twig
        [%make [[%| (lent a) `%$] ~] b]
      ;~(pfix (jest %moar) ;~(plug (star (jest %r)) (toad |.((butt rick)))))
    ::
    ++  glop  ~+((glue mash))                           ::  separated by space
    ++  gunk  ~+((glue muck))                           ::  separated list
    ++  butt  |*  zor/rule                              ::  closing == if tall
              ?:(tol ;~(sfix zor ;~(plug gap duz)) zor)
    ++  ulva  |*  zor/rule                              ::  closing -- and tall
              ?.(tol fail ;~(sfix zor ;~(plug gap dun)))
    ++  hank  (most muck loaf)                          ::  gapped twigs
    ++  loaf  ?:(tol tall wide)                         ::  hoon, current width
    ++  mash  ?:(tol gap ;~(plug com ace))              ::  list separator
    ++  muck  ?:(tol gap ace)                           ::  general separator
    ++  teak  %+  knee  *tiki  |.  ~+                   ::  wing or twig
              =+  ^=  gub
                  |=  {a/term b/$%({$& p/wing} {$| p/twig})}
                  ^-  tiki
                  ?-(-.b $& [%& [~ a] p.b], $| [%| [~ a] p.b])
              =+  ^=  wyp
                  ;~  pose
                     %+  cook  gub
                     ;~  plug
                       sym
                       ;~(pfix tis ;~(pose (stag %& rope) (stag %| wide)))
                     ==
                  ::
                     (stag %& (stag ~ rope))
                     (stag %| (stag ~ wide))
                  ==
              ?.  tol  wyp
              ;~  pose
                wyp
              ::
                ;~  pfix
                  ;~(plug ket tis gap)
                  %+  cook  gub
                  ;~  plug
                    sym
                    ;~(pfix gap ;~(pose (stag %& rope) (stag %| tall)))
                  ==
                ==
              ::
                (stag %| (stag ~ tall))
              ==
    ++  rack  (most mash ;~(gunk loaf loaf))            ::  list [twig twig]
    ++  rick  (most mash ;~(gunk rope loaf))            ::  list [wing twig]
    ::
    ::    rune contents
    ::
    ++  expa  |.(loaf)                                  ::  one twig
    ++  expb  |.(;~(gunk loaf loaf))                    ::  two twigs
    ++  expc  |.(;~(gunk loaf loaf loaf))               ::  three twigs
    ++  expd  |.(;~(gunk loaf loaf loaf loaf))          ::  four twigs
    ++  expe  |.(wisp)                                  ::  core tail
    ++  expf  |.(;~(gunk ;~(pfix cen sym) loaf))        ::  %term and twig
    ++  expg  |.(;~(gunk sym loaf))                     ::  term and twig
    ++  exph  |.((butt ;~(gunk rope rick)))             ::  wing, [tile twig]s
    ++  expi  |.((butt ;~(gunk loaf hank)))             ::  one or more twigs
    ++  expj  |.(;~(gunk sym rope loaf))                ::  term, wing, and twig
    ++  expk  |.(;~(gunk loaf ;~(plug loaf (easy ~))))  ::  list of two twigs
    ++  expl  |.(;~(gunk sym loaf loaf))                ::  term, two twigs
    ++  expm  |.((butt ;~(gunk rope loaf rick)))        ::  several [tile twig]s
    ++  expn  |.(;~(gunk loaf (stag %conp (butt hank))))::  autoconsed twigs
    ++  expo  |.(;~(gunk wise loaf loaf))               ::  =;
    ++  expp  |.(;~(gunk (butt rick) loaf))             ::  [wing twig]s, twig
    ++  expq  |.(;~(gunk rope loaf loaf))               ::  wing and two twigs
    ++  expr  |.(;~(gunk loaf wisp))                    ::  twig and core tail
    ++  exps  |.((butt hank))                           ::  closed gapped twigs
    ++  expt  |.(;~(gunk wise rope loaf loaf))          ::  =^
    ++  expu  |.(;~(gunk rope loaf (butt hank)))        ::  wing, twig, twigs
    ++  expv  |.((butt rick))                           ::  just changes
    ++  expz  |.(loaf(bug &))                           ::  twig with tracing
    ::
    ::    tiki expansion for %wt runes
    ::
    ++  tkhp  |.  %+  cook  |=  {a/tiki b/(list (pair twig twig))}
                            (~(wthp ah a) b)
                  (butt ;~(gunk teak rack))
    ++  tkkt  |.  %+  cook  |=  {a/tiki b/twig c/twig}
                            (~(wtkt ah a) b c)
                  ;~(gunk teak loaf loaf)
    ++  tkls  |.  %+  cook  |=  {a/tiki b/twig c/(list (pair twig twig))}
                            (~(wtls ah a) b c)
                  (butt ;~(gunk teak loaf rack))
    ++  tkpt  |.  %+  cook  |=  {a/tiki b/twig c/twig}
                            (~(wtpt ah a) b c)
                  ;~(gunk teak loaf loaf)
    ++  tksg  |.  %+  cook  |=  {a/tiki b/twig c/twig}
                            (~(wtsg ah a) b c)
                  ;~(gunk teak loaf loaf)
    ++  tkts  |.  %+  cook  |=  {a/twig b/tiki}
                            (~(wtts ah b) a)
                  ;~(gunk loaf teak)
    ::
    ::    hint syntax
    ::
    ++  hinb  |.(;~(gunk bont loaf))                    ::  hint and twig
    ++  hinc  |.                                        ::  optional =en, twig
              ;~(pose ;~(gunk bony loaf) ;~(plug (easy ~) loaf))
    ++  hind  |.(;~(gunk bonk loaf bonz loaf))          ::  jet twig "bon"s twig
    ++  hine  |.(;~(gunk bonk loaf))                    ::  jet-hint and twig
    ++  hinf  |.                                        ::  0-3 >s, two twigs
      ;~  pose
        ;~(gunk (cook lent (stun [1 3] gar)) loaf loaf)
        (stag 0 ;~(gunk loaf loaf))
      ==
    ++  hing  |.                                        ::  0-3 >s, three twigs
      ;~  pose
        ;~(gunk (cook lent (stun [1 3] gar)) loaf loaf loaf)
        (stag 0 ;~(gunk loaf loaf loaf))
      ==
    ++  bonk                                            ::  jet signature
      ;~  pfix  cen
        ;~  pose
          ;~(plug sym ;~(pfix col ;~(plug sym ;~(pfix dot ;~(pfix dot dem)))))
          ;~(plug sym ;~(pfix col ;~(plug sym ;~(pfix dot dem))))
          ;~(plug sym ;~(pfix dot dem))
          sym
        ==
      ==
    ++  hinh  |.                                        ::  1/2 numbers, twig
        ;~  gunk
          ;~  pose
            dem
            (ifix [sel ser] ;~(plug dem ;~(pfix ace dem)))
          ==
          loaf
        ==
    ++  bont  ;~  (bend)                                ::  term, optional twig
                ;~(pfix cen sym)
                ;~(pfix dot ;~(pose wide ;~(pfix muck loaf)))
              ==
    ++  bony  (cook |=(a/(list) (lent a)) (plus tis))   ::  base 1 =en count
    ++  bonz                                            ::  term-labelled twigs
      ;~  pose
        (cold ~ sig)
        %+  ifix
          ?:(tol [;~(plug duz gap) ;~(plug gap duz)] [pel per])
        (more mash ;~(gunk ;~(pfix cen sym) loaf))
      ==
    --
  ::
  ++  lang                                              ::  lung sample
    $:  ros/twig                                        ::  XX translation
        $=  vil
        $%  {$tis p/twig}
            {$col p/twig}
            {$ket p/twig}
            {$fas p/twig}
            {$pel p/(list (pair wing twig))}
        ==
    ==
  ::
  ++  lung
    ~+
    %-  bend
    |=  lang
    ^-  (unit twig)
    ?-    -.vil
      $col  ?:(=([%base %bean] ros) ~ [~ %rap ros p.vil])
      $pel  (bind ~(reek ap ros) |=(hyp/wing [%make hyp p.vil]))
      $ket  [~ ros p.vil]
      $fas  =+  tog=~(hock ap ros)
            ?.(?=(@ tog) ~ [~ %coat tog p.vil])
      $tis  =+  tog=~(hock ap ros)
            ?:(=([%0 ~] tog) ~ [~ %name tog p.vil])
    ==
  ::
  ++  long
    %+  knee  *twig  |.  ~+
    ;~  lung
      scat
      ;~  pose
        ;~(plug (cold %tis tis) wide)
        ;~(plug (cold %col col) wide)
        ;~(plug (cold %ket ket) wide)
        ;~(plug (cold %fas fas) wide)
        ;~  plug
          (easy %pel)
          (ifix [pel per] lobo)
        ==
      ==
    ==
  ::
  ++  lobo  (most ;~(plug com ace) ;~(glam rope wide))
  ++  loon  (most ;~(plug com ace) ;~(glam wide wide))
  ++  lute                                              ::  tall [] noun
    ~+
    %+  stag  %conp
    %+  ifix
      [;~(plug sel gap) ;~(plug gap ser)]
    (most gap tall)
  ::
  ++  rope                                              ::  wing form
    %+  knee  *wing
    |.  ~+
    %+  (slug |=({a/limb b/wing} [a b]))
      dot
    ;~  pose
      (cold [%| 0 ~] com)
      %+  cook
        |=({a/(list) b/term} ?~(a b [%| (lent a) `b]))
      ;~(plug (star ket) ;~(pose sym (cold %$ buc)))
    ::
      %+  cook
        |=(a/axis [%& a])
      ;~  pose
        ;~(pfix lus dim:ag)
        ;~(pfix pam (cook |=(a/@ ?:(=(0 a) 0 (mul 2 +($(a (dec a)))))) dim:ag))
        ;~(pfix bar (cook |=(a/@ ?:(=(0 a) 1 +((mul 2 $(a (dec a)))))) dim:ag))
        ven
        (cold 1 dot)
      ==
    ==
  ::
  ++  wise  %+  cook
              |=({a/term b/(unit twig)} ?~(b a [a u.b]))
            ;~(plug sym (punt ;~(pfix fas wide)))
  ++  tall                                              ::  full tall form
    %+  knee  *twig
    |.(~+((wart ;~(pose (norm &) long lute apex:(sail &)))))
  ::
  ++  wide                                              ::  full wide form
    %+  knee  *twig
    |.(~+((wart ;~(pose (norm |) long apex:(sail |)))))
  ::
  ++  wart
    |*  zor/rule
    %+  here
      |=  {a/pint b/twig}
      ?:(bug [%dbug [wer a] b] b)
    zor
  --

