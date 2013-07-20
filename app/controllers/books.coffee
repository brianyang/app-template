mongoose = require 'mongoose'
_ = require 'underscore'

Book = mongoose.model 'Book'

#
# New book form
#
exports.new = (req, res) ->
  res.render 'books/new',
    book: new Book({})
  return

#
# Create new book
#
exports.create = (req, res) ->
  book = new Book req.body
  book.save (err) ->
    if err
      res.render 'books/new',
        errors: err.errors
        book: book
    res.redirect '/books'
    return
  return

exports.show = (req, res) ->
  undefined

#
# Book edit form
#
exports.edit = (req, res) ->
  book = req.book
  res.render 'books/edit',
    book:book
  return

#
# Update book
#
exports.update = (req, res) ->
  book = req.book

  book = _.extend book, req.body
  book.save (err) ->
    if err
      res.render 'books/edit',
        book:book
        errors: err.errors
    else
      req.flash 'notice', book.title + ' was successfully updated.'
      res.redirect '/books'
    return
  return

#
# Delete book
#
exports.destroy = (req, res) ->
  book = req.book
  book.remove (err) ->
    req.flash 'notice', book.title + ' was successfully deleted.'
    res.redirect '/books'

#
# Manage books
#
exports.manage = (req, res) ->
  Book.list (err, books) ->
    res.render 'books/manage',
      books: books
      message: req.flash 'notice'
    return

#
# Books index
#
exports.index = (req, res) ->
  Book.list (err, books) ->
    res.render 'books/index',
      books: books
  return

exports.import = (req, res) ->
  Book.list (err, books) ->
    res.render 'books/import',
      books: books
  return

#
# Find book by ID
#
exports.book = (req, res, next, id) ->
  Book.findById(id).exec (err, book) ->
    return next err if err
    return next new Error 'Failed to load book' if not book

    req.book = book
    next()
    return
  return
