const express = require("express");
const router = express.Router();

router.post("/login", ()=>(console.log("Rota de login")));
router.post("/cadastro", ()=>(console.log("Rota de cadastro")));
router.put("/atualizar", ()=>(console.log("Rota de atualizar")));

module.exports = router;