cask "nocom" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "7f87fd389acdbfb78d690541c5bb4505f9d789bcc8a7872c3d5883cf136d61fc",
         intel: "f46ad13d5e0c14c99c22515f397dc7841632a3b75847c7bcad7e0d8a6919b161"

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

  # O app ainda não é assinado com Developer ID: sem isso o Gatekeeper marca o
  # binário como não verificado e a primeira abertura falha. O caveat abaixo
  # existe até a notarização entrar no build.
  caveats do
    <<~EOS
      O NoCom ainda não é assinado pela Apple. Na primeira vez, o macOS vai dizer
      que o app não pôde ser verificado. Para liberar, rode uma vez:

        xattr -dr com.apple.quarantine "/Applications/NoCom.app"

      Depois disso ele abre normalmente, e as atualizações via brew não pedem
      nada de novo.
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
