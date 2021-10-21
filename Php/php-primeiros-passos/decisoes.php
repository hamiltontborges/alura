<?php

$idade = 17;
$numeroDePessoas = 2;

echo "Você precisa ter a partir de 18 anos para entrar ou a partir de 16 anos acompanhado" . PHP_EOL;

if ($idade >= 18) {
    echo "Você tem $idade anos. Pode entrar sozinho.";
} else if ($idade >= 16 && $numeroDePessoas > 1) {
    echo "Você tem $idade e está acompanhado(a), pode entar.";
} else {
    echo "Você só tem $idade anos. Você não pode entrar.";
}

echo PHP_EOL;
echo "Adeus!";
