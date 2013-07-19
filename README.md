# Node base with Express, Mongoose, and CoffeeScript

## skeleton with methods
- returning json
- proxy APIs

* implement some form of OAuth

## server details

- Object modeling for MongoDB using [Mongoose](http://mongoosejs.com/).
- [Passport.js](http://passportjs.org/) for user authentication.
- [Twitter Bootstrap](http://twitter.github.io/bootstrap/), to jumpstart your UI development.
- [connect-assets](https://github.com/adunkman/connect-assets) for serving CSS, Javascript and images to the client supporting Coffeescript and LESS on the fly.
- [connect-flash](https://github.com/jaredhanson/connect-flash) for helpful error/notice messages.
- [connect-mongo](https://github.com/kcbanner/connect-mongo) for persistent session storage.
- Coffeescript linting using [Grunt](http://gruntjs.com/).
- [node-dev](https://github.com/fgnass/node-dev), an awesome development tool for Node.js that automatically restarts your node process when a script is modified. It also has useful growl notifications:

## client details

- Grunt to generate builds
- Require for AMD script loading
- CoffeeScript for easy development
- bower for dependency management


## html5 epub details

- reads epub and renders html



## File structure
```
├── app
│   ├── controllers
│   ├── helpers
│   ├── models
│   └── views
├── assets
│   ├── css
│   ├── img
│   └── js
├── bin
│   └── devserver (Shell script for firing up node-dev)
├── config
│   ├── environment.coffee
│   ├── express.coffee
│   ├── middlewares
│   ├── passport.coffee
│   ├── routes.coffee
│   └── routes.js
├── epub-reader
│   ├── app
└── ui
│   ├── app
├── server.js



```

