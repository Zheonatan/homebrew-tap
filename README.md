# Zheonatan/tap

Instaladores dos meus apps para macOS, via [Homebrew](https://brew.sh).

## NoCom

Uma lista de tarefas que fica flutuando por cima do seu trabalho e aparece com
um atalho de teclado. Sem conta, sem nuvem, sem sincronização.

```sh
brew tap Zheonatan/tap
brew trust --cask Zheonatan/tap/nocom
brew install --cask nocom
```

Funciona em Apple Silicon e em Intel — o `brew` escolhe a versão certa sozinho.

### Por que o `brew trust`?

Sem ele, o segundo comando falha assim:

```
Error: Refusing to load cask zheonatan/tap/nocom from untrusted tap zheonatan/tap.
```

Não é sinal de problema com o app. Desde o Homebrew 6, qualquer tap que não seja
oficial precisa da sua confiança explícita, uma vez, antes do primeiro uso — é o
`brew` te pedindo para conferir de quem você está instalando, e não uma falha.

O comando acima confia **apenas neste cask**. Existe também `brew trust
zheonatan/tap`, que confia no tap inteiro; a forma estreita é melhor, porque o
que eu publicar aqui depois não entra de carona.

### Primeira vez: liberar o app

O NoCom ainda não é assinado pela Apple, então o macOS vai dizer que **não foi
possível verificar o app**. É esperado, e se resolve com um comando, uma única
vez:

```sh
xattr -dr com.apple.quarantine "/Applications/NoCom.app"
```

Depois disso ele abre normalmente, e as atualizações pelo `brew` não pedem mais
nada.

### Usando

Abra o app uma vez. A partir daí:

| Ação | Como |
| --- | --- |
| Mostrar / esconder a janela | `⌃⌥T` (Control + Option + T) |
| Esconder a janela | `Escape` |
| Trazer de volta sem o teclado | clique no ícone da barra de menus |
| Ver quantas tarefas faltam | passe o mouse no ícone da barra de menus |

O atalho pode ser trocado dentro do app, na engrenagem — útil se `⌃⌥T` já
estiver ocupado na sua máquina.

### Atualizar

```sh
brew upgrade --cask nocom
```

### Instalou quando o app se chamava `mini-todo`?

O app mudou de nome na versão 0.2.0, e a troca é em dois passos:

```sh
brew uninstall --cask mini-todo
brew install --cask nocom
```

Nessa ordem. O `uninstall` tira o `Mini To-Do.app` de `/Applications`; ele não
apaga suas tarefas — elas ficam na pasta de dados, e a primeira abertura do
NoCom copia tudo de lá.

### Desinstalar

```sh
brew uninstall --cask nocom
```

Suas tarefas continuam no disco depois de desinstalar. Para apagar tudo,
inclusive elas:

```sh
brew uninstall --zap --cask nocom
```

## Links

- Código-fonte e downloads diretos (Windows, Linux): [Zheonatan/nocom](https://github.com/Zheonatan/nocom)
- Problemas com a instalação: [abra uma issue](https://github.com/Zheonatan/nocom/issues)
