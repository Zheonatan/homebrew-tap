cask "mini-todo" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "fb9902463f56d29be20b38d22f8255de69ff995e1e2b1ecfa698beaa9e139ef8",
         intel: "cf50d1ff72141023be8dc8f8bc16a40b544eeac331121b87a24fe50a33eaa010"

  url "https://github.com/Zheonatan/nocom/releases/download/v#{version}/Mini.To-Do_#{version}_#{arch}.dmg",
      verified: "github.com/Zheonatan/nocom/"
  name "Mini To-Do"
  desc "Lista de tarefas flutuante, sempre no topo, aberta por atalho global"
  homepage "https://github.com/Zheonatan/nocom"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Tauri v2 exige macOS 10.15 ou mais novo, apesar do 10.13 no Info.plist.
  depends_on macos: ">= :catalina"

  app "Mini To-Do.app"

  # O app ainda não é assinado com Developer ID: sem isso o Gatekeeper marca o
  # binário como não verificado e a primeira abertura falha. O caveat abaixo
  # existe até a notarização entrar no build.
  caveats do
    <<~EOS
      O Mini To-Do ainda não é assinado pela Apple. Na primeira vez, o macOS vai
      dizer que o app não pôde ser verificado. Para liberar, rode uma vez:

        xattr -dr com.apple.quarantine "/Applications/Mini To-Do.app"

      Depois disso ele abre normalmente, e as atualizações via brew não pedem
      nada de novo.
    EOS
  end

  zap trash: [
    "~/Library/Application Support/com.minitodo.app",
    "~/Library/Preferences/com.minitodo.app.plist",
    "~/Library/Saved Application State/com.minitodo.app.savedState",
    "~/Library/WebKit/com.minitodo.app",
  ]
end
