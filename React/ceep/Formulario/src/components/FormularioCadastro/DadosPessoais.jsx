import React, { useState, useContext } from 'react';
import { TextField, Switch, Button, FormControlLabel } from '@material-ui/core';
import ValidacoesCadastro from "../../contexts/ValidacoesCadastro"
import useErros from '../../hooks/useErros';

function DadosPessoais({ aoEnviar }) {
    const [nome, setNome] = useState("");
    const [sobrenome, setSobrenome] = useState("");
    const [cpf, setCpf] = useState("");
    const [promocoes, setPromocoes] = useState(true);
    const [novidades, setNovidades] = useState(true);
    const validacoes = useContext(ValidacoesCadastro);

    const[erros, validarCampos, possoEnviar] = useErros(validacoes);

    return (
        <form onSubmit={(event) => {
            event.preventDefault();
            if (possoEnviar()) {
                aoEnviar({ nome, sobrenome, cpf, promocoes, novidades })
            }
        }}
        >
            <TextField
                value={nome}
                onChange={event => {
                    setNome(event.target.value);
                }}
                onBlur={validarCampos}
                error={!erros.nome.valido}
                helperText={erros.nome.texto}
                id="nome"
                name="nome"
                label="Nome"
                variant="outlined"
                fullWidth
                required
                margin="normal"
            />

            <TextField
                value={sobrenome}
                onChange={event => {
                    setSobrenome(event.target.value);
                }}
                id="sobrenome"
                name="sobrenome"
                label="Sobrenome"
                variant="outlined"
                fullWidth
                required
                margin="normal"
            />

            <TextField
                value={cpf}
                onChange={(event) => {
                    setCpf(event.target.value);
                }}
                onBlur={validarCampos}
                error={!erros.cpf.valido}
                helperText={erros.cpf.texto}
                id="cpf"
                name="cpf"
                label="CPF"
                variant="outlined"
                fullWidth
                required
                margin="normal"
            />

            <FormControlLabel
                control={
                    <Switch
                        checked={promocoes}
                        onChange={(event) => {
                            setPromocoes(event.target.checked)
                        }}
                        name="promocoes"
                        color="primary"
                    />
                }
                label="Promoções"
            />

            <FormControlLabel
                control={
                    <Switch
                        checked={novidades}
                        onChange={(event) => {
                            setNovidades(event.target.checked)
                        }}
                        name="novidades"
                        color="primary"
                    />
                }
                label="Novidades"
            />

            <Button
                variant="contained"
                color="primary"
                type="submit"
                fullWidth> Próximo
            </Button>

        </form>
    );
}

export default DadosPessoais;