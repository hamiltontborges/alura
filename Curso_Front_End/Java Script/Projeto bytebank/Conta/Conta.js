//Classe abstrata
export class Conta {
    constructor(saldoInicial, cliente, agencia) {
        if(this.constructor == Conta) {
            throw new Error ("Você não deveria instanciar diretamente um objeto do tipo 'Conta', pois ela é uma classe abstrata");
        }
        this._saldo = saldoInicial;
        this._cliente = cliente;
        this._agencia = agencia;
    }

    set cliente(novoValor) {
        if (novoValor instanceof Cliente) {
            this._cliente = novoValor;
        }
    }

    get cliente() {
        return this.cliente;
    }

    get saldo() {
        return this.saldo
    }

    sacar(valor) {
        throw new Error("O método 'Sacar' é abstrato.")
    }

    _sacar(valor, taxa) {
        const valorSacado = taxa * valor;
        if (this._saldo >= valorSacado) {
            this._saldo -= valorSacado;
            return valor;
        }

        return 0;
    }

    depositar(valor) {
        this._saldo += valor;
    }

    transferir(valor, conta) {
        const valorSacado = this.sacar(valor);
        conta.depositar(valorSacado);
    }
}