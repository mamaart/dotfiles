{ pkgs, ... }:
{
  home.packages = with pkgs; [ 
    go
    golines
    gofumpt
    golangci-lint
    gotools # goimports, gorename, callgraph, guru
    gomodifytags
    gotests
    iferr
    reftools # fillstruct, fillswitch
    delve # dlv
    ginkgo
    richgo
    gotestsum
    mockgen
    govulncheck

    protobuf
    grpc-tools
    protoc-gen-go
    protoc-gen-go-grpc
    protoc-gen-rust
  ];

  programs.nixvim = {
    # Plugins 
    plugins.lsp.servers.gopls.enable = true;
    extraPlugins = with pkgs.vimPlugins; [ vim-go ];

    extraConfigVim = ''
    augroup GolangMappings
        autocmd FileType go nnoremap <buffer> <CR>r :w<CR>:GoRun<CR>
        autocmd FileType go nnoremap <buffer> <CR>t :w<CR>:GoTest<CR>
        autocmd FileType go nnoremap <buffer> <CR>c :w<CR>:GoCoverage<CR>
        autocmd FileType go nnoremap <buffer> <CR>r :w<CR>:GoRun<CR>

        autocmd FileType go nnoremap <buffer> <leader>jj :w<CR>:GoAddTags<CR>
    augroup END
    '';
  };
}

# Missing packages
#x github.com/josharian/impl
#x github.com/tmc/json-to-struct
#x github.com/abenz1267/gomvp
#x github.com/abice/go-enum
