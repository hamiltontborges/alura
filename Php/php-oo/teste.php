<?php

use Alura\Banco\Modelo\Endereco;

require_once 'autoload.php';

$umEndereco = new Endereco(
    "São Paulo",
    "Centro",
    "Rua 1",
    "87");

echo $umEndereco;