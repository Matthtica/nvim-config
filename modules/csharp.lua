local lspconfig = require'lspconfig'
local pid = vim.fn.getpid()

local omnisharp_bin = "/home/karl/Downloads/omnisharp-linux-arm64/run"

lspconfig.omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) };
    root_dir = lspconfig.util.root_pattern("*.csproj", "*.sln")
}
