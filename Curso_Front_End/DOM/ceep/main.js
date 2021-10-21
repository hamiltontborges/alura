import BotaoConcluir from "./components/concluirTarefa.js";
import BotaoDeletar from "./components/excluirTarefa.js";

const criarTarefa = (evento) => {
    evento.preventDefault();
    const lista = document.querySelector('[data-list]')
    const input = document.querySelector('[data-form-input]')
    const valor = input.value

    const tarefa = document.createElement('li')
    tarefa.classList.add('task')

    const conteudo = `<p class="content">${valor}</p>`

    tarefa.innerHTML = conteudo
    lista.appendChild(tarefa)
    tarefa.appendChild(BotaoConcluir())
    tarefa.appendChild(BotaoDeletar())

    input.value = ""
    }

const novaTarefa = document.querySelector('[data-form-button]')

novaTarefa.addEventListener('click', criarTarefa)

