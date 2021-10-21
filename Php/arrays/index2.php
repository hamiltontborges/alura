<?php

namespace Alura;

$notas = [8, 6, 7, 7.6, 9];

$calculadora = new Calculadora();
$media = $calculadora->calculaMedia($notas);

echo "<p>A média é: $media</p>";

$saldos = [
    2500,
    3000,
    1000,
    2300,
    5000
];

foreach ($saldos as $saldo) {
    echo "<p>$saldo</p>";
}

sort($saldos);

echo "O menor saldo é de: {$saldos[0]}";


$nomes = "Giovani, Maria, João, Paulo, Pedro";

$arrayNomes = explode(",", $nomes);

foreach($arrayNomes as $nome)
{
    echo "<p>$nome</p>";
}

$listaNomes = implode(",", $arrayNomes);

echo "<p>$listaNomes</p>";

?>