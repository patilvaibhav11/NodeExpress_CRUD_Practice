const adminService = require('../service/admin.service')

// Admin Login 
module.exports.loginController = (req, res) =>{
    adminService.adminLoginService(req.body)
    .then(result => res.json(result))
    .catch(err => res.json(err))
}

module.exports.adminDetailController = (req, res) => {
    adminService.adminDetailsService()
    .then(result => res.json(result))
    .catch(err => res.json(err))
}

module.exports.adminUpdateController = (req, res) => {
    adminService.adminUpdateService(req.body)
    .then(result => res.json(result))
    .catch(err => res.json(err))
}

module.exports.adminDeleteController = (req, res) => {
    adminService.adminDeleteService(req.body)
    .then(result => res.json(result))
    .catch(err => res.json(err))
}

module.exports.adminStateConroller = (req, res) => {
    adminService.adminState()
    .then(result => res.json(result))
    .catch(err => res.json(err))
}

module.exports.adminCityController = (req, res) => {
    adminService.adminCity(req.body)
    .then(result => res.json(result))
    .catch(err => res.json(err))
}

module.exports.adminCityController = (req, res) => {
    adminService.adminCity(req.body)
    .then(result => res.json(result))
    .catch(err => res.json(err))
}
