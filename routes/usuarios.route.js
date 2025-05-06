const express = require("express");
const router = express.Router();
const usuariosController = require("../controllers/usuarios.controller");

router.post("/login", usuariosController.login); 
router.post("/", usuariosController.cadastrarUsuarios); 
router.put("/:id", usuariosController.atualizarUsuarios);

module.exports = router;