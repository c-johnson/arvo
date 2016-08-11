(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var Dispatcher, Persistence;

Dispatcher = require('./Dispatcher.coffee');

Persistence = require('./Persistence.coffee');

module.exports = {
  setPasscode: function(pass) {
    return Dispatcher.dispatch({
      setPasscode: pass
    });
  },
  claimShip: function(pass, ship) {
    Dispatcher.dispatch({
      putClaim: {
        pass: pass,
        ship: ship
      }
    });
    return Persistence.put("womb-claim", {
      aut: pass,
      her: ship
    }, (function(_this) {
      return function(err, arg) {
        var data, gotClaim, status;
        data = arg.data, status = arg.status;
        gotClaim = {
          pass: pass,
          ship: ship,
          own: true
        };
        if (status !== 200) {
          gotClaim.own = false;
        }
        Dispatcher.dispatch({
          gotClaim: gotClaim
        });
        _this.getData("/stats", true);
        return _this.getData("/balance/~" + pass, true);
      };
    })(this));
  },
  getData: function(path, fresh) {
    if (fresh == null) {
      fresh = false;
    }
    return Persistence.get({
      path: path,
      fresh: fresh
    }, function(err, arg) {
      var data, status;
      status = arg.status, data = arg.data;
      if (err != null) {
        throw new Error("Client error");
      } else {
        return Dispatcher.dispatch({
          gotData: {
            path: path,
            data: data
          }
        });
      }
    });
  }
};


},{"./Dispatcher.coffee":2,"./Persistence.coffee":3}],2:[function(require,module,exports){
module.exports = new Flux.Dispatcher();


},{}],3:[function(require,module,exports){
var dup;

dup = {};

module.exports = {
  put: function(mark, data, cb) {
    return urb.send(data, {
      mark: mark,
      appl: "hood",
      wall: false
    }, cb);
  },
  get: function(arg, cb) {
    var fresh, path;
    path = arg.path, fresh = arg.fresh;
    if (!(dup[path] === "pending" || (!fresh && dup[path] === "got"))) {
      dup[path] = "pending";
      return urb.bind("/scry/x/womb" + path, {
        appl: "hood"
      }, function(err, dat) {
        cb(err, dat);
        return urb.drop("/scry/x/womb" + path, {
          appl: "hood"
        }, function() {
          return dup[path] = "got";
        });
      }, function(err, nice) {
        var ref;
        if (!(nice != null ? (ref = nice.data) != null ? ref.ok : void 0 : void 0)) {
          dup[path] = "got";
          return cb(err, nice);
        }
      });
    }
  }
};


},{}],4:[function(require,module,exports){
var EventEmitter, WombDispatcher, WombStore, _data, _default, unpackFrond;

EventEmitter = require('events').EventEmitter;

unpackFrond = require('./util.coffee').unpackFrond;

WombDispatcher = require('./Dispatcher.coffee');

_data = {
  pass: sessionStorage.womb_pass
};

_default = {
  claim: "none",
  pass: ""
};

WombStore = _.extend((new EventEmitter).setMaxListeners(50), {
  emitChange: function() {
    return this.emit('change');
  },
  addChangeListener: function(cb) {
    return this.on('change', cb);
  },
  removeChangeListener: function(cb) {
    return this.removeListener("change", cb);
  },
  retrieve: function(path) {
    var ref;
    return (ref = _data[path]) != null ? ref : _default[path.split("/")[0]];
  },
  gotData: function(arg1) {
    var data, path;
    path = arg1.path, data = arg1.data;
    return _data[path] = data;
  },
  putClaim: function(arg1) {
    var ship;
    ship = arg1.ship;
    return _data["claim/" + ship] = "wait";
  },
  gotClaim: function(arg1) {
    var own, ship;
    ship = arg1.ship, own = arg1.own;
    return _data["claim/" + ship] = (own ? "own" : "xeno");
  },
  setPasscode: function(pass) {
    _data.pass = pass;
    return sessionStorage.womb_pass = pass != null ? pass : "";
  }
});

WombStore.dispatchToken = WombDispatcher.register(function(action) {
  var arg, ref, type;
  ref = unpackFrond(action), type = ref[0], arg = ref[1];
  if (WombStore[type]) {
    WombStore[type](arg);
    return WombStore.emitChange();
  }
});

module.exports = WombStore;


},{"./Dispatcher.coffee":2,"./util.coffee":14,"events":16}],5:[function(require,module,exports){
var Actions, Balance, FromStore, History, Label, Mail, Planets, Scry, ShipInput, Shop, Stars, b, clas, code, div, h6, name, p, recl, ref, rele, span;

clas = require('classnames');

Actions = require('../Actions.coffee');

FromStore = (Scry = require('./Scry.coffee')).FromStore;

Shop = require('./Shop.coffee');

Label = require('./Label.coffee');

ShipInput = require('./ShipInput.coffee');

recl = React.createClass;

rele = React.createElement;

name = function(displayName, component) {
  return _.extend(component, {
    displayName: displayName
  });
};

ref = React.DOM, div = ref.div, b = ref.b, h6 = ref.h6, p = ref.p, span = ref.span, code = ref.code;

Mail = function(email) {
  return code({
    className: "email"
  }, email);
};

History = function(history) {
  var key, who;
  if (!history.length) {
    return "purchased directly from Tlon Inc. ";
  } else {
    return span({}, "previously owned by ", (function() {
      var i, len, results;
      results = [];
      for (key = i = 0, len = history.length; i < len; key = ++i) {
        who = history[key];
        results.push(span({
          key: key
        }, Mail(who)));
      }
      return results;
    })(), "and Tlon Inc. ");
  }
};

Stars = Shop("stars", 7);

Planets = Shop("planets", 14);

Balance = Scry("/balance/~:pass", function(arg) {
  var balance, history, owner, planets, stars;
  balance = arg.balance;
  if (balance.fail) {
    return div({}, Label("Invalid passcode", "warning"));
  }
  planets = balance.planets, stars = balance.stars, owner = balance.owner, history = balance.history;
  return div({}, h6({}, "Balance"), p({}, "Hello ", Mail(owner)), p({}, "This balance was ", History(history), "It contains ", b({}, planets || "no"), " Planets ", "and ", b({}, stars || "no"), " Stars."), stars ? rele(Stars) : void 0, planets ? rele(Planets) : void 0);
});

module.exports = name("Claim", FromStore("pass", function(arg) {
  var pass;
  pass = arg.pass;
  return div({}, p({}, "Input a passcode to claim ships: "), ShipInput({
    length: 57,
    defaultValue: pass,
    onInputShip: Actions.setPasscode
  }), pass ? rele(Balance, {
    pass: pass
  }) : void 0);
}));


},{"../Actions.coffee":1,"./Label.coffee":7,"./Scry.coffee":9,"./ShipInput.coffee":10,"./Shop.coffee":12,"classnames":15}],6:[function(require,module,exports){
var Actions, ClaimButton, FromStore, Label, ShipInput, _ClaimButton, button, name, recl, rele;

Actions = require('../Actions.coffee');

FromStore = require('./Scry.coffee').FromStore;

Label = require('./Label.coffee');

ShipInput = require('./ShipInput.coffee');

button = React.DOM.button;

recl = React.createClass;

rele = React.createElement;

name = function(displayName, component) {
  return _.extend(component, {
    displayName: displayName
  });
};

ClaimButton = FromStore("pass", function(arg) {
  var pass, ship;
  pass = arg.pass, ship = arg.ship;
  if (!ship) {
    return button({
      disabled: true
    }, "Claim (invalid)");
  }
  return rele(_ClaimButton, {
    ship: ship,
    onClick: function() {
      return Actions.claimShip(pass, ship);
    }
  });
});

_ClaimButton = FromStore("claim/:ship", function(arg) {
  var claim, onClick;
  claim = arg.claim, onClick = arg.onClick;
  switch (claim) {
    case "own":
      return Label("Claimed!", "success");
    case "wait":
      return Label("Claiming...");
    case "xeno":
      return Label("Taken", "warning");
    case "none":
      return button({
        onClick: onClick
      }, "Claim");
    default:
      throw new Error("Bad claim type: " + claim);
  }
});

module.exports = name("ClaimButton", ClaimButton);


},{"../Actions.coffee":1,"./Label.coffee":7,"./Scry.coffee":9,"./ShipInput.coffee":10}],7:[function(require,module,exports){
var span;

span = React.DOM.span;

module.exports = function(s, type) {
  if (type == null) {
    type = "default";
  }
  return span({
    className: "label label-" + type
  }, s);
};


},{}],8:[function(require,module,exports){
var Claim, Ships, div, h4, ref, rele;

Claim = require('./Claim.coffee');

Ships = require('./Ships.coffee');

rele = React.createElement;

ref = React.DOM, div = ref.div, h4 = ref.h4;

module.exports = function() {
  return div({}, h4({}, "Claims"), rele(Claim, {}), h4({}, "Network"), rele(Ships, {}));
};


},{"./Claim.coffee":5,"./Ships.coffee":11}],9:[function(require,module,exports){
var Actions, FromStore, Scry, Store, div, i, recl, ref, rele;

Actions = require('../Actions.coffee');

Store = require('../Store.coffee');

recl = React.createClass;

rele = React.createElement;

ref = React.DOM, div = ref.div, i = ref.i;

FromStore = function(path, Child) {
  return recl({
    displayName: "FromStore." + path.split('/').join('-'),
    getInitialState: function() {
      return this.retrieveData();
    },
    retrieveData: function() {
      var data, obj;
      data = Store.retrieve(this.getPath());
      return (
        obj = {
          loaded: data != null
        },
        obj["" + (this.getKey())] = data,
        obj
      );
    },
    getKey: function() {
      return path.match(/[a-z0-9-]+/)[0];
    },
    getPath: function() {
      return path.replace(/:([a-z0-9_.~-]+)/g, (function(_this) {
        return function(m, key) {
          return _this.props[key];
        };
      })(this));
    },
    componentDidMount: function() {
      return Store.addChangeListener(this.changeListener);
    },
    componentWillUnmount: function() {
      return Store.removeChangeListener(this.changeListener);
    },
    componentDidUpdate: function(_props, _state) {
      if (_props !== this.props) {
        return this.setState(this.retrieveData());
      }
    },
    changeListener: function() {
      if (this.isMounted()) {
        return this.setState(this.retrieveData());
      }
    },
    render: function() {
      return rele(Child, _.extend({}, this.props, this.state, {
        path: this.getPath()
      }));
    }
  });
};

Scry = function(path, Child) {
  return FromStore(path, recl({
    displayName: "Scry",
    checkProps: function() {
      if (!this.props.loaded) {
        return Actions.getData(this.props.path);
      }
    },
    componentDidMount: function() {
      return this.checkProps();
    },
    componentDidUpdate: function(_props, _state) {
      return this.checkProps();
    },
    render: function() {
      return div({
        style: {
          display: "inline"
        }
      }, !this.props.loaded ? i({
        key: "load"
      }, "Fetching data...") : rele(Child, _.extend({}, this.props, {
        key: "got"
      }), this.props.children));
    }
  }));
};

module.exports = Scry;

module.exports.FromStore = FromStore;


},{"../Actions.coffee":1,"../Store.coffee":4}],10:[function(require,module,exports){
var input, name, recl, shipShape;

shipShape = require('../util.coffee').shipShape;

input = React.DOM.input;

recl = React.createClass;

name = function(displayName, component) {
  return _.extend(component, {
    displayName: displayName
  });
};

module.exports = name("ShipInput", function(arg) {
  var defaultValue, length, onInputShip;
  onInputShip = arg.onInputShip, length = arg.length, defaultValue = arg.defaultValue;
  return input({
    defaultValue: defaultValue,
    onChange: function(arg1) {
      var ship, target;
      target = arg1.target;
      ship = target.value.trim();
      if (ship[0] !== '~') {
        ship = "~" + ship;
      }
      return onInputShip(((shipShape(ship)) && ship.length === length ? ship.slice(1) : void 0));
    }
  });
});


},{"../util.coffee":14}],11:[function(require,module,exports){
var Label, Scry, Stat, clas, code, div, labels, li, name, p, pre, recl, ref, rele, span, ul;

clas = require('classnames');

Scry = require('./Scry.coffee');

Label = require('./Label.coffee');

recl = React.createClass;

rele = React.createElement;

name = function(displayName, component) {
  return _.extend(component, {
    displayName: displayName
  });
};

ref = React.DOM, p = ref.p, ul = ref.ul, li = ref.li, span = ref.span, div = ref.div, pre = ref.pre, code = ref.code;

labels = {
  free: "Unallocated",
  owned: "Issued",
  split: "Distributing"
};

Stat = name("Stat", function(arg) {
  var className, dist, free, live, owned, ship, split, stats;
  stats = arg.stats;
  return ul({}, (function() {
    var ref1, results;
    results = [];
    for (ship in stats) {
      ref1 = stats[ship], live = ref1.live, dist = ref1.dist;
      free = dist.free, owned = dist.owned, split = dist.split;
      className = clas(dist);
      results.push(li({
        className: className,
        key: ship
      }, span({
        className: "mono"
      }, "~" + ship), " (", live, "): ", (function() {
        switch (false) {
          case free == null:
            return Label(labels.free);
          case owned == null:
            return Label(labels.owned);
          case split == null:
            if (_.isEmpty(split)) {
              return Label(labels.split);
            } else {
              return rele(Stat, {
                stats: split
              });
            }
            break;
          default:
            throw new Error("Bad stat: " + (_.keys(dist)));
        }
      })()));
    }
    return results;
  })());
});

module.exports = Scry("/stats", Stat);


},{"./Label.coffee":7,"./Scry.coffee":9,"classnames":15}],12:[function(require,module,exports){
var ClaimButton, Scry, ShipInput, Shop, ShopShips, button, div, h6, li, recl, ref, rele, span, ul;

Scry = require('./Scry.coffee');

ShipInput = require('./ShipInput.coffee');

ClaimButton = require('./ClaimButton.coffee');

ref = React.DOM, ul = ref.ul, li = ref.li, div = ref.div, h6 = ref.h6, button = ref.button, span = ref.span;

recl = React.createClass;

rele = React.createElement;

ShopShips = Scry("/shop/:type/:nth", function(arg) {
  var ship, shop;
  shop = arg.shop;
  return ul({
    className: "shop"
  }, (function() {
    var i, len, results;
    results = [];
    for (i = 0, len = shop.length; i < len; i++) {
      ship = shop[i];
      results.push(li({
        className: "option",
        key: ship
      }, span({
        className: "mono"
      }, "~", ship, " "), rele(ClaimButton, {
        ship: ship
      })));
    }
    return results;
  })());
});

Shop = function(type, length) {
  return recl({
    displayName: "Shop-" + type,
    roll: function() {
      return {
        shipSelector: Math.floor(Math.random() * 10)
      };
    },
    reroll: function() {
      return this.setState(this.roll());
    },
    getInitialState: function() {
      return this.roll();
    },
    onInputShip: function(customShip) {
      return this.setState({
        customShip: customShip
      });
    },
    render: function() {
      var ref1;
      return div({}, h6({}, "Avaliable " + type + " (random). ", button({
        onClick: this.reroll
      }, "Reroll")), rele(ShopShips, _.extend({}, this.props, {
        type: type,
        nth: this.state.shipSelector
      })), h6({}, "Custom"), div({}, "Specific " + type + ": ", rele(ShipInput, {
        length: length,
        onInputShip: this.onInputShip
      }), rele(ClaimButton, {
        ship: (ref1 = this.state.customShip) != null ? ref1 : ""
      })));
    }
  });
};

module.exports = Shop;


},{"./ClaimButton.coffee":6,"./Scry.coffee":9,"./ShipInput.coffee":10}],13:[function(require,module,exports){
var MainComponent, TreeActions;

MainComponent = require('./components/Main.coffee');

TreeActions = window.tree.actions;

TreeActions.registerComponent("womb", MainComponent);


},{"./components/Main.coffee":8}],14:[function(require,module,exports){
var PO, SHIPSHAPE,
  slice = [].slice;

SHIPSHAPE = /^~?([a-z]{3}|[a-z]{6}(-[a-z]{6}){0,3}|[a-z]{6}(-[a-z]{6}){3}(--[a-z]{6}(-[a-z]{6}){3})+)$/;

PO = 'dozmarbinwansamlitsighidfidlissogdirwacsabwissib\nrigsoldopmodfoglidhopdardorlorhodfolrintogsilmir\nholpaslacrovlivdalsatlibtabhanticpidtorbolfosdot\nlosdilforpilramtirwintadbicdifrocwidbisdasmidlop\nrilnardapmolsanlocnovsitnidtipsicropwitnatpanmin\nritpodmottamtolsavposnapnopsomfinfonbanporworsip\nronnorbotwicsocwatdolmagpicdavbidbaltimtasmallig\nsivtagpadsaldivdactansidfabtarmonranniswolmispal\nlasdismaprabtobrollatlonnodnavfignomnibpagsopral\nbilhaddocridmocpacravripfaltodtiltinhapmicfanpat\ntaclabmogsimsonpinlomrictapfirhasbosbatpochactid\nhavsaplindibhosdabbitbarracparloddosbortochilmac\ntomdigfilfasmithobharmighinradmashalraglagfadtop\nmophabnilnosmilfopfamdatnoldinhatnacrisfotribhoc\nnimlarfitwalrapsarnalmoslandondanladdovrivbacpol\nlaptalpitnambonrostonfodponsovnocsorlavmatmipfap\n\nzodnecbudwessevpersutletfulpensytdurwepserwylsun\nrypsyxdyrnuphebpeglupdepdysputlughecryttyvsydnex\nlunmeplutseppesdelsulpedtemledtulmetwenbynhexfeb\npyldulhetmevruttylwydtepbesdexsefwycburderneppur\nrysrebdennutsubpetrulsynregtydsupsemwynrecmegnet\nsecmulnymtevwebsummutnyxrextebfushepbenmuswyxsym\nselrucdecwexsyrwetdylmynmesdetbetbeltuxtugmyrpel\nsyptermebsetdutdegtexsurfeltudnuxruxrenwytnubmed\nlytdusnebrumtynseglyxpunresredfunrevrefmectedrus\nbexlebduxrynnumpyxrygryxfeptyrtustyclegnemfermer\ntenlusnussyltecmexpubrymtucfyllepdebbermughuttun\nbylsudpemdevlurdefbusbeprunmelpexdytbyttyplevmyl\nwedducfurfexnulluclennerlexrupnedlecrydlydfenwel\nnydhusrelrudneshesfetdesretdunlernyrsebhulryllud\nremlysfynwerrycsugnysnyllyndyndemluxfedsedbecmun\nlyrtesmudnytbyrsenwegfyrmurtelreptegpecnelnevfes';

module.exports = {
  unpackFrond: function(a) {
    var alts, key, ref;
    ref = _.keys(a), key = ref[0], alts = 2 <= ref.length ? slice.call(ref, 1) : [];
    if (!_.isEmpty(alts)) {
      throw new Error("Improper frond: " + ([key].concat(slice.call(alts)).join(',')));
    }
    return [key, a[key]];
  },
  shipShape: function(a) {
    return (SHIPSHAPE.test(a)) && _.all(a.match(/[a-z]{3}/g), function(b) {
      return -1 !== PO.indexOf(b);
    });
  }
};


},{}],15:[function(require,module,exports){
/*!
  Copyright (c) 2016 Jed Watson.
  Licensed under the MIT License (MIT), see
  http://jedwatson.github.io/classnames
*/
/* global define */

(function () {
	'use strict';

	var hasOwn = {}.hasOwnProperty;

	function classNames () {
		var classes = [];

		for (var i = 0; i < arguments.length; i++) {
			var arg = arguments[i];
			if (!arg) continue;

			var argType = typeof arg;

			if (argType === 'string' || argType === 'number') {
				classes.push(arg);
			} else if (Array.isArray(arg)) {
				classes.push(classNames.apply(null, arg));
			} else if (argType === 'object') {
				for (var key in arg) {
					if (hasOwn.call(arg, key) && arg[key]) {
						classes.push(key);
					}
				}
			}
		}

		return classes.join(' ');
	}

	if (typeof module !== 'undefined' && module.exports) {
		module.exports = classNames;
	} else if (typeof define === 'function' && typeof define.amd === 'object' && define.amd) {
		// register as 'classnames', consistent with npm package name
		define('classnames', [], function () {
			return classNames;
		});
	} else {
		window.classNames = classNames;
	}
}());

},{}],16:[function(require,module,exports){
// Copyright Joyent, Inc. and other Node contributors.
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to permit
// persons to whom the Software is furnished to do so, subject to the
// following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
// NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
// DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
// USE OR OTHER DEALINGS IN THE SOFTWARE.

function EventEmitter() {
  this._events = this._events || {};
  this._maxListeners = this._maxListeners || undefined;
}
module.exports = EventEmitter;

// Backwards-compat with node 0.10.x
EventEmitter.EventEmitter = EventEmitter;

EventEmitter.prototype._events = undefined;
EventEmitter.prototype._maxListeners = undefined;

// By default EventEmitters will print a warning if more than 10 listeners are
// added to it. This is a useful default which helps finding memory leaks.
EventEmitter.defaultMaxListeners = 10;

// Obviously not all Emitters should be limited to 10. This function allows
// that to be increased. Set to zero for unlimited.
EventEmitter.prototype.setMaxListeners = function(n) {
  if (!isNumber(n) || n < 0 || isNaN(n))
    throw TypeError('n must be a positive number');
  this._maxListeners = n;
  return this;
};

EventEmitter.prototype.emit = function(type) {
  var er, handler, len, args, i, listeners;

  if (!this._events)
    this._events = {};

  // If there is no 'error' event listener then throw.
  if (type === 'error') {
    if (!this._events.error ||
        (isObject(this._events.error) && !this._events.error.length)) {
      er = arguments[1];
      if (er instanceof Error) {
        throw er; // Unhandled 'error' event
      }
      throw TypeError('Uncaught, unspecified "error" event.');
    }
  }

  handler = this._events[type];

  if (isUndefined(handler))
    return false;

  if (isFunction(handler)) {
    switch (arguments.length) {
      // fast cases
      case 1:
        handler.call(this);
        break;
      case 2:
        handler.call(this, arguments[1]);
        break;
      case 3:
        handler.call(this, arguments[1], arguments[2]);
        break;
      // slower
      default:
        args = Array.prototype.slice.call(arguments, 1);
        handler.apply(this, args);
    }
  } else if (isObject(handler)) {
    args = Array.prototype.slice.call(arguments, 1);
    listeners = handler.slice();
    len = listeners.length;
    for (i = 0; i < len; i++)
      listeners[i].apply(this, args);
  }

  return true;
};

EventEmitter.prototype.addListener = function(type, listener) {
  var m;

  if (!isFunction(listener))
    throw TypeError('listener must be a function');

  if (!this._events)
    this._events = {};

  // To avoid recursion in the case that type === "newListener"! Before
  // adding it to the listeners, first emit "newListener".
  if (this._events.newListener)
    this.emit('newListener', type,
              isFunction(listener.listener) ?
              listener.listener : listener);

  if (!this._events[type])
    // Optimize the case of one listener. Don't need the extra array object.
    this._events[type] = listener;
  else if (isObject(this._events[type]))
    // If we've already got an array, just append.
    this._events[type].push(listener);
  else
    // Adding the second element, need to change to array.
    this._events[type] = [this._events[type], listener];

  // Check for listener leak
  if (isObject(this._events[type]) && !this._events[type].warned) {
    if (!isUndefined(this._maxListeners)) {
      m = this._maxListeners;
    } else {
      m = EventEmitter.defaultMaxListeners;
    }

    if (m && m > 0 && this._events[type].length > m) {
      this._events[type].warned = true;
      console.error('(node) warning: possible EventEmitter memory ' +
                    'leak detected. %d listeners added. ' +
                    'Use emitter.setMaxListeners() to increase limit.',
                    this._events[type].length);
      if (typeof console.trace === 'function') {
        // not supported in IE 10
        console.trace();
      }
    }
  }

  return this;
};

EventEmitter.prototype.on = EventEmitter.prototype.addListener;

EventEmitter.prototype.once = function(type, listener) {
  if (!isFunction(listener))
    throw TypeError('listener must be a function');

  var fired = false;

  function g() {
    this.removeListener(type, g);

    if (!fired) {
      fired = true;
      listener.apply(this, arguments);
    }
  }

  g.listener = listener;
  this.on(type, g);

  return this;
};

// emits a 'removeListener' event iff the listener was removed
EventEmitter.prototype.removeListener = function(type, listener) {
  var list, position, length, i;

  if (!isFunction(listener))
    throw TypeError('listener must be a function');

  if (!this._events || !this._events[type])
    return this;

  list = this._events[type];
  length = list.length;
  position = -1;

  if (list === listener ||
      (isFunction(list.listener) && list.listener === listener)) {
    delete this._events[type];
    if (this._events.removeListener)
      this.emit('removeListener', type, listener);

  } else if (isObject(list)) {
    for (i = length; i-- > 0;) {
      if (list[i] === listener ||
          (list[i].listener && list[i].listener === listener)) {
        position = i;
        break;
      }
    }

    if (position < 0)
      return this;

    if (list.length === 1) {
      list.length = 0;
      delete this._events[type];
    } else {
      list.splice(position, 1);
    }

    if (this._events.removeListener)
      this.emit('removeListener', type, listener);
  }

  return this;
};

EventEmitter.prototype.removeAllListeners = function(type) {
  var key, listeners;

  if (!this._events)
    return this;

  // not listening for removeListener, no need to emit
  if (!this._events.removeListener) {
    if (arguments.length === 0)
      this._events = {};
    else if (this._events[type])
      delete this._events[type];
    return this;
  }

  // emit removeListener for all listeners on all events
  if (arguments.length === 0) {
    for (key in this._events) {
      if (key === 'removeListener') continue;
      this.removeAllListeners(key);
    }
    this.removeAllListeners('removeListener');
    this._events = {};
    return this;
  }

  listeners = this._events[type];

  if (isFunction(listeners)) {
    this.removeListener(type, listeners);
  } else if (listeners) {
    // LIFO order
    while (listeners.length)
      this.removeListener(type, listeners[listeners.length - 1]);
  }
  delete this._events[type];

  return this;
};

EventEmitter.prototype.listeners = function(type) {
  var ret;
  if (!this._events || !this._events[type])
    ret = [];
  else if (isFunction(this._events[type]))
    ret = [this._events[type]];
  else
    ret = this._events[type].slice();
  return ret;
};

EventEmitter.prototype.listenerCount = function(type) {
  if (this._events) {
    var evlistener = this._events[type];

    if (isFunction(evlistener))
      return 1;
    else if (evlistener)
      return evlistener.length;
  }
  return 0;
};

EventEmitter.listenerCount = function(emitter, type) {
  return emitter.listenerCount(type);
};

function isFunction(arg) {
  return typeof arg === 'function';
}

function isNumber(arg) {
  return typeof arg === 'number';
}

function isObject(arg) {
  return typeof arg === 'object' && arg !== null;
}

function isUndefined(arg) {
  return arg === void 0;
}

},{}]},{},[13]);
