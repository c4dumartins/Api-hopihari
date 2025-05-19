const mysql = require('../mysql');

exports.getNotificacoes = async (req, res) => {
    try {
        const resultado = await mysql.execute(`
            SELECT * FROM notifications WHERE status = true
            AND id_users = ?;`,

            [res.locals.idUsuario]
        );

        return res.status(201).send({
            "Mensagem": "As notificações estão funcionando",
            "Resultado": resultado
        });


    } catch (error) {
        return res.status(500).send(error);
    }

};