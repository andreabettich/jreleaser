cask "{{brewCaskName}}" do
  version "{{projectVersion}}"
  sha256 "{{distributionChecksumSha256}}"

  url "{{distributionUrl}}",
      verified: "{{repoHost}}"
  name "{{brewCaskDisplayName}}"
  desc "{{projectDescription}}"
  homepage "{{projectWebsite}}"
  {{#brewCaskHasAppcast}}
  appcast {{brewCaskAppcast}}
  {{/brewCaskHasAppcast}}
  auto_updates true

  {{#brewHasLivecheck}}
  livecheck do
    {{#brewLivecheck}}
    {{.}}
    {{/brewLivecheck}}
  end
  {{/brewHasLivecheck}}
  {{#brewDependencies}}
  depends_on {{.}}
  {{/brewDependencies}}

  {{#brewCaskHasPkg}}
  pkg "{{brewCaskPkg}}"
  {{/brewCaskHasPkg}}
  {{#brewCaskHasApp}}
  app "{{brewCaskApp}}"
  {{/brewCaskHasApp}}
  {{#brewCaskHasBinary}}
  binary "{{distributionArtifactName}}/bin/{{distributionExecutable}}"
  {{/brewCaskHasBinary}}
  {{#brewCaskHasUninstall}}
  {{#brewCaskUninstall}}
  uninstall {{name}}: [
    {{#items}}
    "{{.}}",
    {{/items}}
  ]
  {{/brewCaskUninstall}}
  {{/brewCaskHasUninstall}}
  {{#brewCaskHasZap}}
  {{#brewCaskZap}}
  zap {{name}}: [
    {{#items}}
    "{{.}}",
    {{/items}}
  ]
  {{/brewCaskZap}}
  {{/brewCaskHasZap}}
end