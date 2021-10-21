<?php

function sacar(array $conta, float $valorSaque): array
{
    if ($valorSaque > $conta['saldo']) {
        exibeMensagem("Você não pode sacar.");
    } else {
        $conta['saldo'] -= $valorSaque;
    }
    return $conta;
}

function depositar(array $conta, float $valorDeposito): array
{
    if ($valorDeposito > 0) {
        $conta["saldo"] += $valorDeposito;
    } else {
        exibeMensagem("O valor do depósito deve ser positivo.");
    }
    return $conta;
}

function exibeMensagem(string $mensagem)
{
    echo $mensagem . "<br>";
}

function titularComLetraMaiuscula(array &$conta)
{
    $conta["titular"] = mb_strtoupper($conta["titular"]);
    exibeMensagem("{$conta['titular']}");
}

function exibeConta(array $conta)
{
    ['titular' => $titular, 'saldo' => $saldo] = $conta;
    echo "<li>Titular: $titular. Saldo: $saldo</li>";
}
