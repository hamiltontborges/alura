<?php declare(strict_types=1);

namespace Alura;

class ArrayUtils
{

    public static function remover(string $elemento, array &$array): void
    {
        $posicao = array_search($elemento, $array, true);
        if(is_int($posicao))
        {
        unset($array[$posicao]);
        } else {
            echo "Elemento não encontrado no array";
        }
    }

    public static function encontrarPessoasComSaldoMaior(int $saldo, array $array) :array
    {
        $maiores= [];
        foreach($array as $chave => $valor) {
            if ($valor > $saldo) {
                $maiores[] = $chave;
            }
        }
        return $maiores;
    }
}

?>