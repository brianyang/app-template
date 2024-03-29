// Generated by CoffeeScript 1.6.2
var Vendor, mongoose, _;

mongoose = require('mongoose');

_ = require('underscore');

Vendor = mongoose.model('Vendor');

exports["new"] = function(req, res) {
  res.render('vendors/new', {
    vendor: new Vendor({})
  });
};

exports.create = function(req, res) {
  var vendor;

  vendor = new Vendor(req.body);
  vendor.save(function(err) {
    if (err) {
      res.render('vendors/new', {
        errors: err.errors,
        vendor: vendor
      });
    }
    res.redirect('/vendors');
  });
};

exports.show = function(req, res) {
  return void 0;
};

exports.edit = function(req, res) {
  var vendor;

  vendor = req.vendor;
  res.render('vendors/edit', {
    vendor: vendor
  });
};

exports.update = function(req, res) {
  var vendor;

  vendor = req.vendor;
  vendor = _.extend(vendor, req.body);
  vendor.save(function(err) {
    if (err) {
      res.render('vendors/edit', {
        vendor: vendor,
        errors: err.errors
      });
    } else {
      req.flash('notice', vendor.title + ' was successfully updated.');
      res.redirect('/vendors');
    }
  });
};

exports.destroy = function(req, res) {
  var vendor;

  vendor = req.vendor;
  return vendor.remove(function(err) {
    req.flash('notice', vendor.title + ' was successfully deleted.');
    return res.redirect('/vendors');
  });
};

exports.manage = function(req, res) {
  return Vendor.list(function(err, vendors) {
    res.render('vendors/manage', {
      vendors: vendors,
      message: req.flash('notice')
    });
  });
};

exports.index = function(req, res) {
  Vendor.list(function(err, vendors) {
    return res.render('vendors/index', {
      vendors: vendors
    });
  });
};

exports.json = function(req, res) {
  Vendor.list(function(err, vendors) {
    return res.json({
      vendors: vendors
    });
  });
};

exports.vendor = function(req, res, next, id) {
  Vendor.findById(id).exec(function(err, vendor) {
    if (err) {
      return next(err);
    }
    if (!vendor) {
      return next(new Error('Failed to load vendor'));
    }
    req.vendor = vendor;
    next();
  });
};
