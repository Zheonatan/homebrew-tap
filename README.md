# Zheonatan/tap

Instaladores dos meus apps para macOS, via [Homebrew](https://brew.sh).

## Mini To-Do

Uma lista de tarefas que fica flutuando por cima do seu trabalho e aparece com
um atalho de teclado. Sem conta, sem nuvem, sem sincronização.

```sh
brew tap Zheonatan/tap
brew install --cask mini-todo
```

Funciona em Apple Silicon e em Intel — o `brew` escolhe a versão certa sozinho.

### Primeira vez: liberar o app

O Mini To-Do ainda não é assinado pela Apple, então o macOS vai dizer que **não
foi possível verificar o app**. É esperado, e se resolve com um comando, uma
única vez:

```sh
xattr -dr com.apple.quarantine "/Applications/Mini To-Do.app"
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
brew upgrade --cask mini-todo
```

### Desinstalar

```sh
brew uninstall --cask mini-todo
```

Suas tarefas continuam no disco depois de desinstalar. Para apagar tudo,
inclusive elas:

```sh
brew uninstall --zap --cask mini-todo
```

## Links

- Código-fonte e downloads diretos (Windows, Linux): [Zheonatan/nocom](https://github.com/Zheonatan/nocom)
- Problemas com a instalação: [abra uma issue](https://github.com/Zheonatan/nocom/issues)
