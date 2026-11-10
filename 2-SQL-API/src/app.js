import express from "express"
import conexao from "../infra/conexao"

const app = express()

//express serve para ler json
app.use(express.json());

//criar rota
app.get("/estudantes", (req, res) => {
    const sql = "SELECT * FROM dados_estudantes"
    conexao.query(sql, (erro, resultado) => {
        if (erro) {
            console.log(erro)
        } else {
            res.status(200).json(resultado)
        }
    })
});

app.get("/estudantes/:id", (req, res) => {
    const id = req.params.id
    const sql = "SELECT * FROM dados_estudantes WHERE id_estudantes=?"
    conexao.query(sql, id, (erro, resultado) => {
        if (erro) {
            console.log(erro)
        } else {
            res.status(200).json(resultado)
        }
    })
})

app.post("/estudantes", (req, res) => {
    const estudante = req.body
    const sql = "INSERT INTO dados_estudantes SET ?"
    conexao.query(sql, estudante, (erro, resultado) => {
        if(erro){
            console.log(erro)
        }else{
            res.status(200).json(resultado)
        }
    })
})