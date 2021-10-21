const fs = require('fs')
const path = require('path')

module.exports = (caminho, nomeDoArquivo, callbackImagemCriada) => {

    const tiposValidos = ['jpg', 'jpeg', 'png']
    const tipo = path.extname(caminho)
    const tipoEhValido = tiposValidos.indexOf(tipo.substring(1)) !== -1

    if (tipoEhValido) {

        const novoCaminho = `./assets/img/${nomeDoArquivo}${tipo}`
        fs.createReadStream(caminho)
            .pipe(fs.createWriteStream(novoCaminho))
            .on('finish', () => callbackImagemCriada(false, novoCaminho))
    } else {
        const erro = "Tipo de arquivo é inválido"
        console.log('Erro, tipo inválido')
        callbackImagemCriada(erro)
    }
}
