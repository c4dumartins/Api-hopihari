const express = require("express");
const router = express.Router();
const usuariosController = require("../controllers/usuarios.controller");
const login = require("../middleware/usuarios.middleware");

router.post("/login", usuariosController.login); 
router.put("/", login.required, usuariosController.atualizarUsuarios);
router.post("/", usuariosController.cadastrarUsuarios); 


module.exports = router;