const express = require('express');
const router = express.Router()
const adminController = require('../controllers/admin.controller');

// Admin Login 
router.post('/login',adminController.loginController)
router.post('/adminDetails',adminController.adminDetailController)
router.post('/adminUpdate',adminController.adminUpdateController)
router.post('/adminDelete',adminController.adminDeleteController)
router.post('/adminState',adminController.adminStateConroller)
router.post('/adminCity',adminController.adminCityController)



module.exports = router