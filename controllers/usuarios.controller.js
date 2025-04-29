const mysql = require('../mysql');

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
        return res.status(500).send({"Mensagem": error});
    }
}

exports.cadastrarUsuarios = async (req, res) => {
    try {
        const resultado = await mysql.execute(
            `insert into users (
                name, email, password
            )  
            values (?, ?, ?)`,
             [
               req.body.name,
               req.body.email, 
               req.body.password
            ]
        );
          
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