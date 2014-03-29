"use strict";
! function() {
    var a, b;
    angular.module("firebase", []).value("Firebase", Firebase), angular.module("firebase").factory("$firebase", ["$q", "$parse", "$timeout", function(b, c, d) {
        return function(e) {
            var f = new a(b, c, d, e);
            return f.construct()
        }
    }]), angular.module("firebase").filter("orderByPriority", function() {
        return function(a) {
            var b = [];
            if (a) if (a.$getIndex && "function" == typeof a.$getIndex) {
                var c = a.$getIndex();
                if (c.length > 0) for (var d = 0; d < c.length; d++) {
                    var e = a[c[d]];
                    e && (e.$id = c[d], b.push(e))
                }
            } else angular.isArray(a) ? b = a.slice(0) : angular.isObject(a) && angular.forEach(a, function(a) {
                b.push(a)
            });
            return b
        }
    }), Array.prototype.indexOf || (Array.prototype.indexOf = function(a, b) {
        if (void 0 === this || null === this) throw new TypeError("'this' is null or not defined");
        var c = this.length >>> 0;
        for (b = +b || 0, 1 / 0 === Math.abs(b) && (b = 0), 0 > b && (b += c, 0 > b && (b = 0)); c > b; b++) if (this[b] === a) return b;
        return -1
    }), a = function(a, b, c, d) {
        if (this._q = a, this._parse = b, this._timeout = c, this._bound = !1, this._loaded = !1, this._index = [], this._on = {
            value: [],
            change: [],
            loaded: [],
            child_added: [],
            child_moved: [],
            child_changed: [],
            child_removed: []
        }, "string" == typeof d) throw new Error("Please provide a Firebase reference instead of a URL, eg: new Firebase(url)");
        this._fRef = d
    }, a.prototype = {
        construct: function() {
            var b = this,
                c = {};
            return c.$id = b._fRef.ref().name(), c.$bind = function(a, c, d) {
                return b._bind(a, c, d)
            }, c.$add = function(a) {
                function c(a) {
                    a ? e.reject(a) : e.resolve(d)
                }
                var d, e = b._q.defer();
                return d = "object" == typeof a ? b._fRef.ref().push(b._parseObject(a), c) : b._fRef.ref().push(a, c), e.promise
            }, c.$save = function(a) {
                function c(a) {
                    a ? d.reject(a) : d.resolve()
                }
                var d = b._q.defer();
                if (a) {
                    var e = b._parseObject(b._object[a]);
                    b._fRef.ref().child(a).set(e, c)
                } else b._fRef.ref().set(b._parseObject(b._object), c);
                return d.promise
            }, c.$set = function(a) {
                var c = b._q.defer();
                return b._fRef.ref().set(b._parseObject(a), function(a) {
                    a ? c.reject(a) : c.resolve()
                }), c.promise
            }, c.$update = function(a) {
                var c = b._q.defer();
                return b._fRef.ref().update(b._parseObject(a), function(a) {
                    a ? c.reject(a) : c.resolve()
                }), c.promise
            }, c.$transaction = function(a, c) {
                var d = b._q.defer();
                return b._fRef.ref().transaction(a, function(a, b, c) {
                    a ? d.reject(a) : d.resolve(b ? c : null)
                }, c), d.promise
            }, c.$remove = function(a) {
                function c(a) {
                    a ? d.reject(a) : d.resolve()
                }
                var d = b._q.defer();
                return a ? b._fRef.ref().child(a).remove(c) : b._fRef.ref().remove(c), d.promise
            }, c.$child = function(c) {
                var d = new a(b._q, b._parse, b._timeout, b._fRef.ref().child(c));
                return d.construct()
            }, c.$on = function(a, d) {
                if (!b._on.hasOwnProperty(a)) throw new Error("Invalid event type " + a + " specified");
                return b._sendInitEvent(a, d), "loaded" === a && this._loaded || b._on[a].push(d), c
            }, c.$off = function(a, c) {
                if (b._on.hasOwnProperty(a)) if (c) {
                    var d = b._on[a].indexOf(c); - 1 !== d && b._on[a].splice(d, 1)
                } else b._on[a] = [];
                else b._fRef.off()
            }, c.$auth = function(a) {
                var c = b._q.defer();
                return b._fRef.auth(a, function(a, b) {
                    null !== a ? c.reject(a) : c.resolve(b)
                }, function(a) {
                    c.reject(a)
                }), c.promise
            }, c.$getIndex = function() {
                return angular.copy(b._index)
            }, c.$getRef = function() {
                return b._fRef.ref()
            }, b._object = c, b._getInitialValue(), b._object
        },
        _getInitialValue: function() {
            function a(a, b) {
                var c = a.name(),
                    e = a.val(),
                    f = g._index.indexOf(c);
                if (-1 !== f && g._index.splice(f, 1), b) {
                    var h = g._index.indexOf(b);
                    g._index.splice(h + 1, 0, c)
                } else g._index.unshift(c);
                d(e) || null === a.getPriority() || (e.$priority = a.getPriority()), g._updateModel(c, e)
            }
            function b(a, b) {
                return function(c, d) {
                    b(c, d), g._broadcastEvent(a, g._makeEventSnapshot(c.name(), c.val(), d))
                }
            }
            function c(a, c) {
                g._fRef.on(a, b(a, c))
            }
            function d(a) {
                return null === a || "object" != typeof a
            }
            function e(a) {
                g._loaded = !0, g._broadcastEvent("loaded", a)
            }
            function f(a) {
                if (g._bound && null === a) {
                    var b = g._parseObject(g._parse(g._name)(g._scope));
                    switch (typeof b) {
                        case "string":
                        case "undefined":
                            a = "";
                            break;
                        case "number":
                            a = 0;
                            break;
                        case "boolean":
                            a = !1
                    }
                }
                return a
            }
            var g = this;
            c("child_added", a), c("child_moved", a), c("child_changed", a), c("child_removed", function(a) {
                var b = a.name(),
                    c = g._index.indexOf(b);
                g._index.splice(c, 1), g._updateModel(b, null)
            }), g._fRef.on("value", function(a) {
                var b = a.val();
                d(b) ? (b = f(b), g._updatePrimitive(b)) : delete g._object.$value, g._broadcastEvent("value", g._makeEventSnapshot(a.name(), b)), g._loaded || e(b)
            })
        },
        _updateModel: function(a, b) {
            null == b ? delete this._object[a] : this._object[a] = b, this._broadcastEvent("change", a), this._triggerModelUpdate()
        },
        _triggerModelUpdate: function() {
            if (!this._runningTimer) {
                var a = this;
                this._runningTimer = a._timeout(function() {
                    if (a._runningTimer = null, a._bound) {
                        var b = a._object,
                            c = a._parse(a._name)(a._scope);
                        angular.equals(b, c) || a._parse(a._name).assign(a._scope, angular.copy(b))
                    }
                })
            }
        },
        _updatePrimitive: function(a) {
            var b = this;
            b._timeout(function() {
                if (b._object.$value && angular.equals(b._object.$value, a) || (b._object.$value = a), b._broadcastEvent("change"), b._bound) {
                    var c = b._parseObject(b._parse(b._name)(b._scope));
                    angular.equals(c, a) || b._parse(b._name).assign(b._scope, a)
                }
            })
        },
        _broadcastEvent: function(a, b) {
            function c(a, b) {
                e._timeout(function() {
                    a(b)
                })
            }
            var d = this._on[a] || [];
            "loaded" === a && (this._on[a] = []);
            var e = this;
            if (d.length > 0) for (var f = 0; f < d.length; f++) "function" == typeof d[f] && c(d[f], b)
        },
        _sendInitEvent: function(a, b) {
            var c = this;
            c._loaded && ["child_added", "loaded", "value"].indexOf(a) > -1 && c._timeout(function() {
                var d = angular.isObject(c._object) ? c._parseObject(c._object) : c._object;
                switch (a) {
                    case "loaded":
                        b(d);
                        break;
                    case "value":
                        b(c._makeEventSnapshot(c._fRef.name(), d, null));
                        break;
                    case "child_added":
                        c._iterateChildren(d, function(a, d, e) {
                            b(c._makeEventSnapshot(a, d, e))
                        })
                }
            })
        },
        _iterateChildren: function(a, b) {
            if (this._loaded && angular.isObject(a)) {
                var c = null;
                for (var d in a) a.hasOwnProperty(d) && (b(d, a[d], c), c = d)
            }
        },
        _makeEventSnapshot: function(a, b, c) {
            return angular.isUndefined(c) && (c = null), {
                snapshot: {
                    name: a,
                    value: b
                },
                prevChild: c
            }
        },
        _bind: function(a, b, c) {
            var d = this,
                e = d._q.defer();
            d._name = b, d._bound = !0, d._scope = a;
            var f = d._parse(b)(a);
            void 0 !== f && "object" == typeof f && d._fRef.ref().update(d._parseObject(f));
            var g = a.$watch(b, function() {
                var c = d._parseObject(d._parse(b)(a));
                void 0 !== d._object.$value && angular.equals(c, d._object.$value) || angular.equals(c, d._parseObject(d._object)) || void 0 !== c && d._loaded && (d._fRef.set ? d._fRef.set(c) : d._fRef.ref().update(c))
            }, !0);
            return a.$on("$destroy", function() {
                g()
            }), d._fRef.once("value", function(f) {
                d._timeout(function() {
                    "object" != typeof f.val() ? (null == f.val() && "function" == typeof c && (a[b] = c()), e.resolve(g)) : d._timeout(function() {
                        null == f.val() && "function" == typeof c && (a[b] = c()), e.resolve(g)
                    })
                })
            }), e.promise
        },
        _parseObject: function(a) {
            function b(a) {
                for (var c in a) a.hasOwnProperty(c) && ("$priority" == c ? (a[".priority"] = a.$priority, delete a.$priority) : "object" == typeof a[c] && b(a[c]));
                return a
            }
            var c = b(angular.copy(a));
            return angular.fromJson(angular.toJson(c))
        }
    }, angular.module("firebase").factory("$firebaseSimpleLogin", ["$q", "$timeout", "$rootScope", function(a, c, d) {
        return function(e) {
            var f = new b(a, c, d, e);
            return f.construct()
        }
    }]), b = function(a, b, c, d) {
        if (this._q = a, this._timeout = b, this._rootScope = c, this._loginDeferred = null, this._getCurrentUserDeferred = [], this._currentUserData = void 0, "string" == typeof d) throw new Error("Please provide a Firebase reference instead of a URL, eg: new Firebase(url)");
        this._fRef = d
    }, b.prototype = {
        construct: function() {
            var a = {
                user: null,
                $login: this.login.bind(this),
                $logout: this.logout.bind(this),
                $createUser: this.createUser.bind(this),
                $changePassword: this.changePassword.bind(this),
                $removeUser: this.removeUser.bind(this),
                $getCurrentUser: this.getCurrentUser.bind(this),
                $sendPasswordResetEmail: this.sendPasswordResetEmail.bind(this)
            };
            if (this._object = a, !window.FirebaseSimpleLogin) {
                var b = new Error("FirebaseSimpleLogin is undefined. Did you forget to include firebase-simple-login.js?");
                throw this._rootScope.$broadcast("$firebaseSimpleLogin:error", b), b
            }
            var c = new FirebaseSimpleLogin(this._fRef, this._onLoginEvent.bind(this));
            return this._authClient = c, this._object
        },
        login: function(a, b) {
            var c = this._q.defer(),
                d = this;
            return this.getCurrentUser().then(function() {
                d._loginDeferred = c, d._authClient.login(a, b)
            }), c.promise
        },
        logout: function() {
            this._authClient.logout(), delete this._currentUserData
        },
        createUser: function(a, b) {
            var c = this,
                d = this._q.defer();
            return c._authClient.createUser(a, b, function(a, b) {
                a ? (c._rootScope.$broadcast("$firebaseSimpleLogin:error", a), d.reject(a)) : d.resolve(b)
            }), d.promise
        },
        changePassword: function(a, b, c) {
            var d = this,
                e = this._q.defer();
            return d._authClient.changePassword(a, b, c, function(a) {
                a ? (d._rootScope.$broadcast("$firebaseSimpleLogin:error", a), e.reject(a)) : e.resolve()
            }), e.promise
        },
        getCurrentUser: function() {
            var a = this,
                b = this._q.defer();
            return void 0 !== a._currentUserData ? b.resolve(a._currentUserData) : a._getCurrentUserDeferred.push(b), b.promise
        },
        removeUser: function(a, b) {
            var c = this,
                d = this._q.defer();
            return c._authClient.removeUser(a, b, function(a) {
                a ? (c._rootScope.$broadcast("$firebaseSimpleLogin:error", a), d.reject(a)) : d.resolve()
            }), d.promise
        },
        sendPasswordResetEmail: function(a) {
            var b = this,
                c = this._q.defer();
            return b._authClient.sendPasswordResetEmail(a, function(a) {
                a ? (b._rootScope.$broadcast("$firebaseSimpleLogin:error", a), c.reject(a)) : c.resolve()
            }), c.promise
        },
        _onLoginEvent: function(a, b) {
            if (this._currentUserData !== b || null !== a) {
                var c = this;
                a ? (c._loginDeferred && (c._loginDeferred.reject(a), c._loginDeferred = null), c._rootScope.$broadcast("$firebaseSimpleLogin:error", a)) : (this._currentUserData = b, c._timeout(function() {
                    for (c._object.user = b, b ? c._rootScope.$broadcast("$firebaseSimpleLogin:login", b) : c._rootScope.$broadcast("$firebaseSimpleLogin:logout"), c._loginDeferred && (c._loginDeferred.resolve(b), c._loginDeferred = null); c._getCurrentUserDeferred.length > 0;) {
                        var a = c._getCurrentUserDeferred.pop();
                        a.resolve(b)
                    }
                }))
            }
        }
    }
}();
