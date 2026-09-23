# auto-sync.ps1
Write-Host "Verificando mudanças..."
git add .

$status = git status --porcelain
if ([string]::IsNullOrWhiteSpace($status)) {
    Write-Host "Nenhuma mudança para commitar."
    exit 0
}

$commitMessage = Read-Host "Digite a mensagem de commit (ou pressione Enter para usar a mensagem padrão)"

if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    $commitMessage = "Atualização automática: deploy e sync scripts"
}

git commit -m "$commitMessage"
Write-Host "Commit realizado. Fazendo push para o repositório..."
git push

Write-Host "Sincronização concluída com sucesso!"
