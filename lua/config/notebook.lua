vim.api.nvim_create_user_command('NewNotebook', function(opts)
  local name = opts.args
  if name == "" then
    print("Usage: :NewNotebook <nom_du_fichier>")
    return
  end
  
  -- Ajouter l'extension .ipynb si elle n'est pas présente
  if not name:match('%.ipynb$') then
    name = name .. '.ipynb'
  end
  
  -- Chemin complet du nouveau fichier
  local full_path = vim.fn.expand('%:p:h') .. '/' .. name
  
  -- Contenu du notebook minimal
  local notebook_content = {
    cells = {},
    metadata = {
      kernelspec = {
        display_name = "Python 3",
        language = "python",
        name = "python3"
      },
      language_info = {
        name = "python",
        version = "3.9.0"
      }
    },
    nbformat = 4,
    nbformat_minor = 5
  }
  
  -- Écrire le fichier
  local file = io.open(full_path, "w")
  if file then
    file:write(vim.fn.json_encode(notebook_content))
    file:close()
    print("Notebook créé : " .. full_path)
    -- Ouvrir le fichier
    vim.cmd('edit ' .. full_path)
  else
    print("Erreur : Impossible de créer le fichier " .. full_path)
  end
end, { nargs = '*' })
