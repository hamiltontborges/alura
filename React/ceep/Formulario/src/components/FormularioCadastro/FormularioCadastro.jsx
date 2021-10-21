import React, { useEffect, useState } from 'react';
import DadosPessoais from "./DadosPessoais"
import DadosUsuario from "./DadosUsuario"
import DadosEntrega from "./DadosEntrega"
import Typography from '@material-ui/core/Typography'
import Stepper from '@material-ui/core/Stepper'
import Step from '@material-ui/core/Step'
import StepLabel from '@material-ui/core/StepLabel'


function FormularioCadastro({ aoEnviar }) {
    const [etapaAtual, setEtapaAtual] = useState(0)
    const [dadosColetados, setDados] = useState({});

    useEffect(() => {
        if (etapaAtual === formularios.length - 1) {
            aoEnviar(dadosColetados)
        }
    });

    const formularios = [
        <DadosUsuario aoEnviar={coletarDados} />,
        <DadosPessoais aoEnviar={coletarDados} />,
        <DadosEntrega aoEnviar={coletarDados} />,
        <Typography variant="h5">Obrigado pelo cadastro!</Typography>
    ];

    function coletarDados(dados) {
        setDados({ ...dadosColetados, ...dados });
        console.log(dadosColetados);
        proximo();
    }

    function proximo() {
        setEtapaAtual(etapaAtual + 1);
    }

    return <>
        <Stepper activeStep={etapaAtual}>
            <Step><StepLabel>Login</StepLabel></Step>
            <Step><StepLabel>Pessoal</StepLabel></Step>
            <Step><StepLabel>Endereço</StepLabel></Step>
            <Step><StepLabel>Finalização</StepLabel>
            </Step>
        </Stepper>
        {formularios[etapaAtual]}</>;
}

export default FormularioCadastro;