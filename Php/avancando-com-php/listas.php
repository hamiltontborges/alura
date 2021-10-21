<?php

$idadesList = [25, 26, 30, 58, 12, 15];

list($idadePaulo, $idadeJoao, $idadePedro) = $idadesList;

$idadesList[] = 20;

foreach ($idadesList as $idade) {
    echo $idade . PHP_EOL;
}

echo "$idadeJoao";