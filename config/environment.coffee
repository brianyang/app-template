module.exports =
  development:
    app:
      name: 'epub cloud reader'
    root: require('path').normalize(__dirname + '/..')
    db: process.env.MONGOLAB_URI || process.env.MONGOHQ_URL \
        || 'mongodb://localhost/ereader'
