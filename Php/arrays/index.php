<?php

namespace Alura;

require "autoload.php";

$correntistas = [
    'Giovanni',
    'João',
    'Maria',
    'Luis',
    'Luisa',
    'Rafael',
];

$saldos = [
    2500,
    3000,
    4400,
    1000,
    8700,
    9000,
];

$relacionados = array_combine($correntistas, $saldos);

echo "<pre>";
var_dump($relacionados);

$saldoMaiores = ArrayUtils::encontrarPessoasComSaldoMaior(3000, $relacionados);
var_dump($saldoMaiores);

echo "</pre>";

?>