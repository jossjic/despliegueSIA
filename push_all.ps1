# Navegar al directorio del primer submódulo
Set-Location -Path ".\apiSIA"

# Agregar cambios, commitear y hacer push en el primer submódulo
git add .
git commit -m "Update apiSIA"
git push origin main  # o la rama correspondiente

# Volver al directorio raíz
Set-Location -Path ".."

# Navegar al directorio del segundo submódulo
Set-Location -Path ".\SIA"

# Agregar cambios, commitear y hacer push en el segundo submódulo
git add .
git commit -m "Update SIA"
git push origin main  # o la rama correspondiente

# Volver al directorio raíz
Set-Location -Path ".."

# Agregar los submódulos al repositorio principal, commitear y hacer push
git add .\apiSIA .\SIA
git commit -m "Updated submodule references"
git push origin main  # o la rama correspondiente
