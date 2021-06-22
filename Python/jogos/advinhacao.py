import cores as cor

import random

def jogar():
    print(f"\n{cor.vermelho()}{cor.negrito()}*******************************{cor.restaura_cor_original()}")
    print(f'{cor.amarelo()}{cor.negrito()}Bem-vindo ao jogo de advinhação{cor.restaura_cor_original()}')
    print(f"{cor.vermelho()}{cor.negrito()}*******************************{cor.restaura_cor_original()}")

    numero_secreto =random.randrange(0, 101)
    total_tentativas = 0
    pontos = 1000

    print(f'{cor.ciano()}Qual nível de dificuldade?')
    print('(1) Fácil\n(2) Médio\n(3) Difícil')
    nivel = int(input(f'Escolha o nível: {cor.restaura_cor_original()}'))

    if (nivel == 1):
        total_tentativas = 20
    elif(nivel == 2):
        total_tentativas = 10
    else:
        total_tentativas = 5

    for rodada in range(1, total_tentativas + 1):
        print(f'\nTentativa {rodada} de {total_tentativas}')

        chute_str = input('Digite um número entre 1 e 100: ')
        print('Você digitou', chute_str)
        chute = int(chute_str)

        if(chute < 1 or chute > 100):
            print('Você deve digitar um número entre 1 e 100!')
            continue

        acertou = chute == numero_secreto
        maior = chute > numero_secreto
        menor = chute < numero_secreto

        if (acertou):
            print(f'Você acertou e fez {pontos}!')
            break
        else:
            if (maior):
                print('Você errou! O seu chute foi MAIOR que o número secreto.')

            elif (menor):
                print('Você errou! O seu chute foi MENOR que o número secreto.')

            pontos_perdidos = abs(numero_secreto - chute) 
            pontos = pontos - pontos_perdidos    
        rodada += 1

    print(f'\n{cor.verde()}O número secreto era o {numero_secreto}{cor.restaura_cor_original()}')

    print('\nFim do jogo!\n')

if(__name__== '__main__'):
    jogar()
