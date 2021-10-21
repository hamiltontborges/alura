const BotaoDeletar = () => {
    const botaoDeleta = document.createElement('button')
    botaoDeleta.classList.add('delete-button')
    botaoDeleta.textContent = 'deletar'

    botaoDeleta.addEventListener('click', deletarTarefa)
    return botaoDeleta
}

const deletarTarefa = (evento) => {
    const botaoDeleta = evento.target
    const tarefaExcluida = botaoDeleta.parentElement

    tarefaExcluida.remove()
}

export default BotaoDeletar