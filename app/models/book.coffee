mongoose = require 'mongoose'

#
# Getters and setters for tags
#
getTags = (tags) ->
  return tags.join ','

setTags = (tags) ->
  return tags.split ','

#
# Book Schema
#
Schema = mongoose.Schema

BookSchema = new Schema
  title:
    type: String
    trim: true
    required: true

  body:
    type: String
    required: true

  tags:
    type: []
    get: getTags
    set: setTags

  createdAt:
    type: Date
    default: Date.now

#
# Schema statics
#
BookSchema.statics =
  list: (cb) ->
    this.find().sort
      createdAt: -1
    .exec(cb)
    return

Book = mongoose.model 'Book', BookSchema
