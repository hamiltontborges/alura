import React, { Component } from "react";
import './App.css';
import FormularioCadastro from "./components/FormularioCadastro/FormularioCadastro"
import { Container, Typography } from '@material-ui/core/';
import 'fontsource-roboto';
import { validarCPF, validarSenha } from "./models/cadastro"
import ValidacoesCadastro from "../src/contexts/ValidacoesCadastro"


class App extends Component {
  render() {
    return (
      <Container component="article" maxWidth="xs">
        <Typography variant="h3" component="h1" align="center">Formulário de cadastro</Typography>
        <ValidacoesCadastro.Provider value={{ cpf: validarCPF, senha: validarSenha, nome: validarSenha }} >
          <FormularioCadastro aoEnviar={aoEnviarForm} />
        </ValidacoesCadastro.Provider>
      </Container>
    );
  }
}

function aoEnviarForm(dados) {
  console.log(dados);
}


export default App;
