{
  programs.nixvim = {
    options.completeopt = ["menu" "menuone" "noselect"];

    plugins = {

      # Create the syntax tree between functions etc.
      treesitter.enable = true;
      # Highlights function name if big
      treesitter-context.enable = true;

      # Snippet engine for nvim-cmp
      luasnip.enable = true;

      nvim-cmp = {
        enable = true;

	# Snippet engine
        snippet.expand = "luasnip";

        mapping = {
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<C-n>" = {
            modes = ["i" "s"];
            action = "cmp.mapping.select_next_item()";
          };
          "<C-p>" = {
            modes = ["i" "s"];
            action = "cmp.mapping.select_prev_item()";
          };
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };

        sources = [
          {name = "path";}
          {name = "nvim_lsp";}
          {name = "cmp_tabnine";}
          {name = "luasnip";}
          {
            name = "buffer";
            # Words from other open buffers can also be suggested.
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
          {name = "neorg";}
        ];
      };

      # All the language servers
      lsp = {
        enable = true;

        keymaps = {
          silent = true;
          diagnostic = {
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
        };

        #TODO move this out of here
        servers = {
          bashls.enable = true; #Bash
          jsonls.enable = true; #Json
        };
      };

      # Makes the dropdown menu
      lspkind = {
        enable = true;

        cmp = {
          enable = true;
          menu = {
            nvim_lsp = "[LSP]";
            nvim_lua = "[api]";
            path = "[path]";
            luasnip = "[snip]";
            buffer = "[buffer]";
            neorg = "[neorg]";
            cmp_tabnine = "[TabNine]";
          };
        };
      };

    };
  };
}
