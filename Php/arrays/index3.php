<?php declare(strict_types=1);

namespace Alura;

require "autoload.php";

$correntistas_e_compras = [
    "Giovanni",
    "João",
    12,
    "Maria",
    25,
    "Luis",
    "Luisa",
    "12",
    "Rafael",
];

// ArrayUtils::remover("12", $correntistas_e_compras);

ArrayUtils::remover("Giovanni", $correntistas_e_compras);

echo '<pre>';
var_dump($correntistas_e_compras);
echo '</pre>';

?>