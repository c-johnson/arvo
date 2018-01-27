=<  |=(a=* %.(a (map time collection)))             ::  collections by name
|%                                                  ::
++  collection                                      ::
  $:  conf/{mod/@da config}                         ::  configuration
      tops/(map @da topicful)                       ::
      $~                                            ::  /.  compatibility
  ==                                                ::
++  topicful                                        ::
  $:  info/{mod/@da topic}                          ::
      coms/(map @da {mod/@da comment})              ::
      $~                                            ::  /.  compatibility
  ==                                                ::
::                                                  ::
++  config                                          ::
  $:  desc/cord                                     ::  description
      publ/?                                        ::  public or private
      visi/?                                        ::  visible or hidden
      mems/(set ship)                               ::  ships on list
  ==                                                ::
++  topic                                           ::
  $:  tit/cord                                      ::  title
      who/ship                                      ::  author
      wat/wain                                      ::  content
  ==                                                ::
++  comment                                         ::
  $:  who/ship                                      ::  author
      wat/wain                                      ::  content
  ==                                                ::
::
++  api
  |%
  ++  kind  ?($blog $fora $note)                      ::
  ++  action                                          ::
    $%  $:  $create                                   ::  create a collection
            wat/kind                                  ::  collection kind
            des/cord                                  ::  name
            pub/?                                     ::  public or private
            vis/?                                     ::  visible or hidden
            ses/(set ship)                            ::  black/whitelist
        ==                                            ::
        {$submit col/time tit/cord wat/wain}          ::  submit a post/note
        {$resubmit col/time top/@da tit/cord wat/wain} ::  edit a post/note
        {$comment col/time top/@da com/?(~ @da) wat/wain} ::  submit a comment
        {$delete col/time}                            ::  delete a collection
        ::
        ::REVIEW names? nest collection/topic/comment actions?
        {$delete-topic col/time top/@da}              ::  delete a collection
        {$delete-comment col/time top/@da com/@da}    ::  delete a collection
    ==                                                ::
  --
--
