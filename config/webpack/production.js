process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')
environment.entry.set("main", "./app/javascript/application.js")

module.exports = environment.toWebpackConfig()
