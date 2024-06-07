# Definir la función para hacer pull en un submódulo
function Pull-Submodule {
    param (
        [string]$submodulePath
    )
    
    # Navegar al directorio del submódulo
    Set-Location -Path $submodulePath
    
    # Hacer pull en el submódulo
    git pull origin main  # o la rama correspondiente

    # Volver al directorio raíz
    Set-Location -Path ".."
}

# Hacer pull en el primer submódulo
Pull-Submodule -submodulePath ".\apiSIA"

# Hacer pull en el segundo submódulo
Pull-Submodule -submodulePath ".\SIA"

# Hacer pull en el repositorio principal
git pull origin main  # o la rama correspondiente

# Actualizar los submódulos para reflejar los cambios del repositorio principal
git submodule update --init --recursive
