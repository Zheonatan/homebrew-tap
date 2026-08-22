cask "nocom" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "75648d312007d1a9bee08e548ef429ed92e33d927cef6fe40e924547466ccf4b",
         intel: "047c3cae0fb04e31c2433608d9dbd2ec62410f0fa6b99fc1793259b0da1cb0eb"

  url "https://github.com/Zheonatan/nocom/releases/download/v#{version}/NoCom_#{version}_#{arch}.dmg"
  name "NoCom"
  desc "Lista de tarefas flutuante, sempre no topo, aberta por atalho global"
  homepage "https://github.com/Zheonatan/nocom"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Tauri v2 exige macOS 10.15 ou mais novo, apesar do 10.13 no Info.plist.
  depends_on macos: :catalina

  app "NoCom.app"

  # O app não é assinado com Developer ID -- a assinatura é ad-hoc, que basta para
  # executar mas não para o Gatekeeper avaliar. Somada à quarentena que o `brew`
  # carimba, o macOS não diz "não foi possível verificar": diz que o app **está
  # danificado**, e oferece "Mover para o Lixo" como o botão de cima.
  #
  # É por isso que este caveat existe e é tão explícito. Quem lê "danificado"
  # conclui que o download veio corrompido, e o caminho mais óbvio na tela apaga o
  # app. O texto precisa chegar antes do diálogo -- e chega: o `brew` imprime o
  # caveat ao terminar de instalar, segundos antes da primeira abertura.
  #
  # E repete a cada `upgrade`, porque o `brew` recarimba em toda instalação e
  # desde o Homebrew 6 não há como desligar: o `--no-quarantine` foi removido sem
  # substituto. Sai daqui quando a notarização entrar no build.
  caveats do
    <<~EOS
      O NoCom ainda não é assinado pela Apple.

      Na primeira abertura o macOS vai dizer que o app "está danificado e não
      pode ser aberto", e oferecer "Mover para o Lixo". Ele NÃO está danificado:
      é o Gatekeeper reclamando da assinatura, e esse botão apaga o app.

      Clique em Cancelar, e tire a marca de quarentena:

        xattr -dr com.apple.quarantine "/Applications/NoCom.app"

      Rode isso de novo depois de cada 'brew upgrade --cask nocom'. Atualizando
      pelo botão de dentro do app não é necessário.
    EOS
  end

  # `com.minitodo.app` é a pasta da 0.1.0, quando o app se chamava "Mini To-Do".
  # Entra aqui porque o `zap` é a promessa de não deixar nada para trás, e a
  # migração de nome copia os arquivos em vez de movê-los — quem veio da versão
  # antiga tem estado nas duas pastas.
  zap trash: [
    "~/Library/Application Support/com.nocom.app",
    "~/Library/Application Support/com.minitodo.app",
    "~/Library/Preferences/com.nocom.app.plist",
    "~/Library/Saved Application State/com.nocom.app.savedState",
    "~/Library/WebKit/com.nocom.app",
  ]
end
