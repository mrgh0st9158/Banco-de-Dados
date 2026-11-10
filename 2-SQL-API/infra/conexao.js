import mysql from "mysql2"

const conexao = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "*Guc146687",
    database: "cadastro_estudantes"
});

conexao.connect()

export default conexao