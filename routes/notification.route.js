const express = require("express");
const router = express.Router();
const notificationController = require("../controllers/notifications.controller");
const login = require("../middleware/usuarios.middleware");

router.get("/", login.required, notificationController.getNotificacoes);

module.exports = router;