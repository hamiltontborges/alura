import cores as cor

import forca
import advinhacao

def escolhe_jogo():
    print(f"\n{cor.vermelho()}{cor.negrito()}*******************************{cor.restaura_cor_original()}")
    print(f'{cor.amarelo()}{cor.negrito()}***** Escolha o seu Jogo: *****{cor.restaura_cor_original()}')
    print(f"{cor.vermelho()}{cor.negrito()}*******************************{cor.restaura_cor_original()}")

    print('(1) Forca\n(2) Advinhação')

    jogo = int(input("Qual seu jogo? "))

    if(jogo == 1):
        print('\nJogando Forca')
        forca.jogar()
    elif(jogo == 2):
        print('\nJogando Advinhação')  
        advinhacao.jogar()

if(__name__ == '__main__'):
    escolhe_jogo()