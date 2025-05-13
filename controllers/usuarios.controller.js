const mysql = require('../mysql');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

exports.atualizarUsuarios = async (req, res) => {
    try {
        const idUsuario = Number(req.params.id);
        const resultado = await mysql.execute(
            `UPDATE users
               SET name      = ?,
				   email     = ?,
                   password  = ?
             WHERE id = ?;`,
             [
               req.body.name,
               req.body.email, 
               req.body.password, 
               idUsuario
            ]
        );
          
        return res.status(201).send({
            "Mensagem": "Usuário atualizado com sucesso",
            "Resultado": resultado
        });
    } catch (error) {
        return res.status(500).send(error);
    }
}

exports.cadastrarUsuarios = async (req, res) => {
    try {
        const hash = await bcrypt.hash(req.body.password, 10);
        const resultado = await mysql.execute(
            `INSERT INTO users (first_name, last_name, email, password, birth_date, phone)
            VALUES (?, ?, ?, ?, ?, ?);`,
             [
               req.body.first_name,
               req.body.last_name,
               req.body.email, 
               hash,
               req.body.birth_date,
               req.body.phone 
            ]
        );
        console.log(hash)

          
        return res.status(201).send({
            "Mensagem": "Usuário cadastrado com sucesso",
            "Resultado": resultado
        });
    } catch (error) {
        console.error("Erro:", error); // Isso vai mostrar no terminal
        return res.status(500).send({
            "Mensagem": "Erro interno no servidor",
            "Detalhes": error.message || JSON.stringify(error)
        });
    }
}

exports.login = async (req, res) => {
    try { 
        const usuario = await mysql.execute(
            `SELECT * FROM users WHERE email = ?;`,
            [req.body.email]);
        console.log(usuario);

        if (usuario.length == 0) {
            return res.status(401).send({ "Mensagem": "Usuário não cadastrado" });
        }

        const match = await bcrypt.compare(req.body.password, usuario[0].password);
        console.log(match, req.body.password, usuario[0].password);
        if (!match) {
            return res.status(401).send({ "Mensagem": "Senha incorreta" });
        }

        const token = jwt.sign({
            id: usuario[0].id,
            first_name: usuario[0].first_name,
            last_name: usuario[0].last_name,
            email: usuario[0].email,
            birth_date: usuario[0].birth_date,
            phone: usuario[0].phone
        }, "senhadojwt");
        return res.status(200).send({
            "Mensagem": "Usuário autenticado com Sucesso",
            "token": token
        });
        
    } catch (error) {
        return res.status(500).send(error);
    }
}