# Zheonatan/tap

Instaladores dos meus apps para macOS, via [Homebrew](https://brew.sh).

## NoCom

Uma lista de tarefas que fica flutuando por cima do seu trabalho e aparece com
um atalho de teclado. Sem conta, sem nuvem, sem sincronização.

```sh
brew tap Zheonatan/tap
brew install --cask nocom
```

Funciona em Apple Silicon e em Intel — o `brew` escolhe a versão certa sozinho.

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

O app mudou de nome na versão 0.2.0. Um `brew upgrade` faz a troca sozinho — o
`brew` reconhece o nome antigo e migra para `nocom`. Suas tarefas vêm junto: a
primeira abertura da versão nova copia tudo da pasta de dados anterior.

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
