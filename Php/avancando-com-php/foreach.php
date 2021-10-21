<?php

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

$contasCorrentes["159.263.847-65"] = [
    "titular" => 'Claudia',
    "saldo" => 2002
];

foreach ($contasCorrentes as $cpf => $conta) {
    echo $cpf . " " . $conta['titular'] . PHP_EOL;
}
