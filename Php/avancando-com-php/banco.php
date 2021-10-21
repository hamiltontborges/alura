<?php

require_once 'funcoes.php';

$contasCorrentes = [
    "123.456.789-10" => [
        'titular' => 'Hamilton',
        'saldo' => 1000
    ],
    "456.789.123-85" => [
        'titular' => 'Maria',
        'saldo' => 10000
    ],
    "258.741.369-74" => [
        'titular' => 'Alberto',
        'saldo' => 300
    ]
];

$contasCorrentes["123.456.789-10"] = sacar(
    $contasCorrentes["123.456.789-10"],
    500
);

$contasCorrentes["456.789.123-85"] = sacar(
    $contasCorrentes["456.789.123-85"],
    500
);

$contasCorrentes["258.741.369-74"] = depositar(
    $contasCorrentes["258.741.369-74"],
    600
);

// titularComLetraMaiuscula($contasCorrentes['258.741.369-74']);
// unset($contasCorrentes['258.741.369-74']);

// foreach ($contasCorrentes as $cpf => $conta) {
//     ["titular" => $titular, "saldo" => $saldo] = $conta;
//     exibeMensagem(
//         "CPF: $cpf | Titular: $titular | Saldo: $saldo"
//     );
// }

// echo "<ul>";
// foreach ($contasCorrentes as $cpf => $conta) {
//     exibeConta($conta);
// }
// echo "</ul>"
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <h1>Contas</h1>

    <dl>
        <?php foreach ($contasCorrentes as $cpf => $conta) { ?>
            <dt>
                <h3><?= $conta['titular'] ?> - CPF: <?= $cpf; ?></h3>
            </dt>
            <dd>
                <h4>Saldo: <?= $conta['saldo'] ?></h4>
            </dd>
        <?php } ?>
    </dl>
</body>

</html>