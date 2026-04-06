Write-Host "🔍 Checking outdated packages..."
pnpm outdated

Write-Host "🚀 Upgrading core dependencies (Next.js + React)..."
pnpm add next@latest react@latest react-dom@latest

Write-Host "📦 Upgrading dev dependencies..."
pnpm add -D typescript@latest @types/react@latest @types/node@latest eslint@latest eslint-config-next@latest

Write-Host "📦 Upgrading remaining packages..."
pnpm up --latest

Write-Host "🧹 Cleaning project..."
Remove-Item -Recurse -Force node_modules, .next, pnpm-lock.yaml -ErrorAction SilentlyContinue

Write-Host "📥 Reinstalling dependencies..."
pnpm install

Write-Host "🔎 Running type check..."
pnpm exec tsc --noEmit

Write-Host "✅ Upgrade completed! Run 'pnpm dev' to test your app."