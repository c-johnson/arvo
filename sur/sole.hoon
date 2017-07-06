::
::::  /hoon/sole/sur
  ::
|%
++  sole-action                                         ::  sole to app
  $%  ::  {$abo ~}                                      ::  reset interaction
      {$det sole-change}                                ::  command line edit
      {$ret $~}                                         ::  submit and clear
      {$clr $~}                                         ::  exit context
  ==                                                    ::
++  sole-buffer  (list @c)                              ::  command state
++  sole-change                                         ::  network change
  $:  ler/sole-clock                                    ::  destination clock
      haw/@uvH                                          ::  source hash
      ted/sole-edit                                     ::  state change
  ==                                                    ::
++  sole-clock  {own/@ud his/@ud}                       ::  vector clock
++  sole-edit                                           ::  shared state change
  $%  {$del p/@ud}                                      ::  delete one at
      {$ins p/@ud q/@c}                                 ::  insert at
      {$mor p/(list sole-edit)}                         ::  combination
      {$nop $~}                                         ::  no-op
      {$set p/sole-buffer}                              ::  discontinuity
  ==                                                    ::
++  sole-effect                                         ::  app to sole
  $%  {$bel $~}                                         ::  beep
      {$blk p/@ud q/@c}                                 ::  blink+match char at
      {$clr $~}                                         ::  clear screen
      {$det sole-change}                                ::  edit command
      {$err p/@ud}                                      ::  error point
      {$klr p/styx:^dill}                               ::  styled text line
      {$mor p/(list sole-effect)}                       ::  multiple effects
      {$nex $~}                                         ::  save clear command
      {$pro sole-prompt}                                ::  set prompt
      {$sag p/path q/*}                                 ::  save to jamfile
      {$sav p/path q/@}                                 ::  save to file
      {$tan p/(list tank)}                              ::  classic tank
  ::  {$taq p/tanq}                                     ::  modern tank
      {$txt p/tape}                                     ::  text line
      {$url p/@t}                                       ::  activate url
  ==                                                    ::
++  sole-cursor-share                                   ::  command state
  $:  pos/@ud                                           ::  cursor position
      say/sole-share                                    ::  cursor
  ==                                                    ::
++  sole-prompt                                         ::  prompt definition
  $:  vis/?                                             ::  command visible
      tag/term                                          ::  history mode
      cad/styx:^dill                                    ::  caption
  ==                                                    ::
++  sole-share                                          ::  symmetric state
  $:  ven/sole-clock                                    ::  our vector clock
      leg/(list sole-edit)                              ::  unmerged edits
      buf/sole-buffer                                   ::  sole state
  ==                                                    ::
--
