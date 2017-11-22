window.urb = window.urb || {}
window.urb.app = window.urb.app || null

window.urb.init = function(onload){ // XX proper class?
  onload = onload || function(){}
  var $init = this.init
  if($init.loaded) return onload()
  if($init.loading) return $init.loading.push(onload)
  $init.loading = [onload]
  var s = document.createElement('script')
  s.src = "/~/at/~/auth.js" // XX nop.js? auth.json?
  s.onload = function(){
    $init.loading.map(function(f){f()})
    delete $init.loading
    $init.loaded = true
  }
  document.body.appendChild(s)
}
window.urb.init.loaded = !!window.urb.token

window.urb.req = function(method,url,params,json,cb) {
  var xhr = new XMLHttpRequest()
  method = method.toUpperCase()
  if(method == "PUT" || method == "DELETE")
    xhr.open("POST", url+"?"+method)
  else xhr.open(method, url)

  if(json)
    xhr.setRequestHeader("content-type", "text/json")

  xhr.timeout = 60000

  if(!window.urb.token) throw "No CSRF token" // XX fetch auth.json
  _data = {token: window.urb.token}
  if(params.body) { _data.body = params.body; }
  if(params.responseKey) { _data.responseKey = params.responseKey; }
  if(cb) {
    xhr.onload = function() {
      var err,res
      try {
        err = null
        res = {
          status:this.status,
          data: JSON.parse(this.responseText)
        }
        if(res.data.reload)
          res.reload = res.data.reload
      } catch(e) {
        // if(urb.wall !== false) document.write(this.responseText) // XX
        err = {
          message:"Failed to parse JSON",
          raw:this.responseText
        }
        res = null
      }
      finally {
       cb(err,res)
      }
    }
    xhr.ontimeout = function() {
      cb({
        status:408,
        data:null
      })
    }
    xhr.onerror = function() {
      cb({
        status:this.status,
        data:this.responseText
      })
    }
  }
  xhr.send(JSON.stringify(_data))
}

// window.urb.getJSON = function(url,cb){ window.urb.reqJSON("GET",url, null, cb)}
// window.urb.reqJSON = function(method, url, data, cb){
//   var xhr = new XMLHttpRequest()
//   xhr.open(method, url)
//   xhr.onload = function(){
//     urb.fetchTag.call(xhr)
//     if(cb) cb(JSON.parse(xhr.responseText))
//   }
//   xhr.send(data === null ? null : JSON.stringify(data))
// }

window.urb.requestQueue = []
window.urb.queueReq = function(method,url,params,json,cb) {
  walk = function() {
    qobj = {}
    qobj.oargs = window.urb.requestQueue[0]
    qobj.nargs = [].slice.call(qobj.oargs,0,4)
    qobj.nargs.push(function(){
      if(this.oargs[4])
        this.oargs[4].apply(window.urb,arguments)
      window.urb.requestQueue.shift()
      if(window.urb.requestQueue.length > 0)
        walk()
    }.bind(qobj))
    window.urb.req.apply(this,qobj.nargs)
  }
  l = window.urb.requestQueue.length
  window.urb.requestQueue.push(arguments);
  if(l == 0) { walk() }
}

window.urb.send = function(data,params,cb) { // or send(data, cb)
  if(!params || typeof params === "function")
    {cb = params; params = {}}

  var url, $send
  $send = this.send

  params.data = data
  params.ship = params.ship || this.ship
  params.app = params.app || this.app
  params.mark = params.mark || $send.mark
  params.responseKey = params.responseKey || "/"
  params.body = (typeof(params.data) === 'undefined') ? null : params.data


  if(!params.mark) throw new Error("You must specify a mark for urb.send.")
  if(!params.app) throw new Error("You must specify an app for urb.send.")

  url = ["send",params.app,params.mark]
  url = "/~/"+url.join("/")

  this.queueReq('post',url,params,true,function(err,data) {
     if(data && data.data.fail && urb.wall !== false && params.wall !== false) {
      document.location = "#ERROR"
      document.write("<pre>"+JSON.stringify(params.body)+"\n"
                            +data.data.mess+"</pre>") // XX
    }
    if(cb) { cb.apply(this,arguments); }
  })
}

window.urb.send.mark = "json"


window.urb.subscriptionPath = function(params) {
  var path = params.path
  if(!path) path = ""
  if(path[0] !== "/") path = "/"+path
  return  "~"+params.ship+"/"+
          params.app+
          path.replace(/[^\x00-\x7F]/g, "")
}

window.urb.pollStarted = false
window.urb.callbacks = {}
window.urb.poll = function(params) {
  if(!params) throw new Error("You must supply params to urb.poll.")

  var url, $this

  sequenceNumber = this.poll.sequenceNumber
  if(params.sequenceNumber) sequenceNumber = params.sequenceNumber()

  url = "/~/events/"+this.eventStream+"?step="+sequenceNumber

  this.pollStarted = true

  $this = this
  this.req("get",url,params,true,function(err,res) {
    $this.poll.delay = params.delay || $this.poll.delay
    if(res){
      if(res.data.beat) {
        $this.poll.delay = params.delay || 250
        return $this.poll(params)
      }
      switch(res.data.type){
          case "news":
        return document.location.reload()  // XX check autoreload
          case "rush":
          case "mean":
        var err2 = err
        if(res.data.type == "mean")
          err2 = res.data.data
        var responseKey = $this.subscriptionPath(res.data.from)
        if($this.callbacks[responseKey])
          $this.callbacks[responseKey].call(this,err2,
            {status: res.status, data: res.data.data.json}) // XX non-json
        break;
          case "quit":
        //  XX necessary behaviour?
        break;
          default:
        throw new Error("Lost event %"+res.data.type)
      }
      if(params.incs)
        params.incs()
      else
        $this.poll.sequenceNumber++
      $this.poll.delay = 250
      return $this.poll(params)
    }

    else if(err){
      setTimeout(function() {
        $this.poll(params)
      }, $this.poll.delay)
      $this.poll.delay += Math.ceil($this.poll.delay*.2)
    }
    else throw "Neither error nor result on poll"
  })
}
window.urb.poll.sequenceNumber = 1
window.urb.poll.delay = 250

window.urb.bind = function(path, params, cb, nicecb){ // or bind(path, cb)
  if(!params || typeof params === "function")
    {cb = params; params = {}}

  params.path = path
  if(params.path[0] !== "/") params.path = "/"+params.path
  params.ship = params.ship || this.ship
  params.app = params.app || this.app
  params.mark = params.mark || this.bind.mark
  params.responseKey = params.responseKey || params.path

  if(typeof path != "string")
    throw new Error("You must specify a string path for urb.bind.")
  if(!params.app) throw new Error("You must specify an app for urb.bind.")
  if(!cb) throw new Error("You must supply a callback to urb.bind.")

  var method, perm, url, $this

  if(params.mark !== "json")
    throw new Error("Non-json subscriptions unimplemented.")  //  XX
  url = "/~/subscriptions/"+this.subscriptionPath(params)+"."+params.mark

  params.path = params.responseKey
  this.callbacks[this.subscriptionPath(params)] = cb

  $this = this
  this.queueReq("put",url,params,true,function(err,res) {
    if(nicecb) { nicecb.apply(this,[err,{status: res.status, data: res.data}])}
    //  XX give raw data
    //
    if(!err && !$this.pollStarted) $this.poll(params)
  })
}
urb.bind.mark = "json"

window.urb.drop = function(path, params, cb){  // or drop(path,cb)
  if(typeof params === "function")
    {cb = params; params = {}}

  params.path = path
  if(params.path[0] !== "/") params.path = "/"+params.path
  params.ship = params.ship || this.ship
  params.app = params.app || this.app
  params.responseKey = params.responseKey || params.path

  if(typeof path != "string")
    throw new Error("You must specify a string path for urb.drop.")
  if(!params.app) throw new Error("You must specify an app for urb.drop.")

  url = "/~/is/"+this.subscriptionPath(params)+".json"
  method = "delete"
  this.req("delete",url,params,true,function(err,res) {
    if(cb) cb(err,res)
  })
}

window.urb.subscribe = function(params,cb) {   //  legacy interface
  if(!params) throw new Error("You must supply params to urb.subscribe")
  return window.urb.bind(params.path, params, cb, cb)
}

window.urb.unsubscribe = function(params,cb) { //  legacy intreface
  if(!params) throw new Error("You must supply params to urb.unsubscribe.")
  return window.urb.drop(params.path, params, cb)
}

window.urb.util = {
  isURL: function(s) {
     r = new RegExp('^(?!mailto:)(?:(?:http|https|ftp)://)(?:\\S+(?::\\S*)?@)?(?:(?:(?:[1-9]\\d?|1\\d\\d|2[01]\\d|22[0-3])(?:\\.(?:1?\\d{1,2}|2[0-4]\\d|25[0-5])){2}(?:\\.(?:[0-9]\\d?|1\\d\\d|2[0-4]\\d|25[0-4]))|(?:(?:[a-z\\u00a1-\\uffff0-9]+-*)*[a-z\\u00a1-\\uffff0-9]+)(?:\\.(?:[a-z\\u00a1-\\uffff0-9]+-*)*[a-z\\u00a1-\\uffff0-9]+)*(?:\\.(?:[a-z\\u00a1-\\uffff]{2,})))|localhost)(?::\\d{2,5})?(?:(/|\\?|#)[^\\s]*)?$', 'i');
     return s.length < 2083 && r.test(s);
  },
  numDot: function(n) {
    _n = String(n)
    fun = function(s){
      if(s.length <= 3)
        return s
      return fun(s.slice(0,-3))+"."+s.slice(-3)
    }
    return fun((_n))
  },
  toDate: function (dat){
    var mils = Math.floor((0x10000 * dat.getUTCMilliseconds()) / 1000).toString(16)
    function pad(num, str){
      return ((new Array(num + 1)).join('0') + str).substr(-num,num)
    }
    return  '~' + dat.getUTCFullYear() +
            '.' + (dat.getUTCMonth() + 1) +
            '.' + dat.getUTCDate() +
           '..' + pad(2, dat.getUTCHours()) +
            '.' + pad(2, dat.getUTCMinutes()) +
            '.' + pad(2, dat.getUTCSeconds()) +
           '..' + pad(4, mils)
  },
  basepath: function(spur, pathname){
    spur = spur || ''
    if(spur === '/') spur = ''
    pathname = pathname || window.location.pathname

    base = ""

    if(pathname.indexOf("/~~") == 0)
      base = "/~~"
    if(pathname.indexOf("/~/as/") == 0)
      base = "/~/as/"+pathname.split("/")[3]
    if(pathname.indexOf("/~/away") == 0)
      base = "/~/away"

    return base+spur
  }
}
