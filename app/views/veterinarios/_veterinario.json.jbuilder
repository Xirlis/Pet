json.extract! veterinario, :id, :nome, :idade, :telefone, :email, :created_at, :updated_at
json.url veterinario_url(veterinario, format: :json)
