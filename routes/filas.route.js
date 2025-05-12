const express = require("express");
const router = express.Router();

router.post("/", () => {console.log("Rota de fila")});
  

module.exports = router;