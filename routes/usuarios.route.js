const express = require("express");
const router = express.Router();
const usuariosController = require("../controllers/usuarios.controller");

router.post("/login", ()=>(console.log("Rota de login")));
router.post("/cadastro", usuariosController.cadastrarUsuarios); 
router.put("/:id", usuariosController.atualizarUsuarios);

module.exports = router;