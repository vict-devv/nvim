# Neovim Config

A modular Neovim setup in Lua with a LazyVim-style UI, tuned for DevOps/Cloud
and full-stack workflows (Go, Terraform, Python, JavaScript/TypeScript, YAML, Bash).

## Requirements

- **Neovim ≥ 0.11** — required for `vim.lsp.config` / `vim.lsp.enable` API
- **Git** and **make** — lazy.nvim bootstrap + fzf-native build
- A **[Nerd Font](https://www.nerdfonts.com/)** — icons throughout the UI depend on it
- **[ripgrep](https://github.com/BurntSushi/ripgrep)** — live grep via Snacks picker
- **[fd](https://github.com/sharkdp/fd)** — faster file finding
- **[lazygit](https://github.com/jesseduffield/lazygit)** — optional, for the git TUI (`<leader>gs`)
- **[Claude Code CLI](https://claude.ai/download)** — required for claudecode.nvim (`<leader>ac`)

## Installation

```bash
# Back up any existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Drop the config in place
cp -r nvim/ ~/.config/nvim

# Open Neovim — lazy.nvim bootstraps itself then installs all plugins
nvim
```

Mason installs LSP servers automatically on first launch. Run `:Mason` to
manage them manually, or `:checkhealth vim.lsp` to verify server status.

---

## File Structure

```
~/.config/nvim/
├── init.lua                    ← entry point (4 requires)
└── lua/
    ├── core/
    │   ├── options.lua         ← editor settings
    │   ├── keymaps.lua         ← all keybindings
    │   └── autocmds.lua        ← autocommands
    └── plugins/
        └── bootstrap.lua       ← lazy.nvim bootstrap + all plugin specs
```

---

## Plugin Stack

| Category | Plugin | Notes |
|---|---|---|
| Package manager | [lazy.nvim](https://github.com/folke/lazy.nvim) | Auto-installs on first launch |
| Colourscheme | [aura-theme](https://github.com/daltonmenezes/aura-theme) | `aura-dark` variant |
| UI primitives | [nui.nvim](https://github.com/MunifTanjim/nui.nvim) | Dependency for noice + snacks |
| Icons | [mini.icons](https://github.com/echasnovski/mini.icons) | Replaces nvim-web-devicons |
| QoL suite | [snacks.nvim](https://github.com/folke/snacks.nvim) | Explorer, picker, notifier, dashboard, indent, scroll, lazygit, zen, scratch |
| Cmdline / messages | [noice.nvim](https://github.com/folke/noice.nvim) | Popup cmdline, LSP progress, fancy notifications |
| Status line | [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Global statusline |
| Buffer tabs | [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Aura-themed tab bar |
| **Markdown** | [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | In-editor rendered preview — headings, code blocks, checkboxes, bullets |
| **AI** | [claudecode.nvim](https://github.com/coder/claudecode.nvim) | Claude Code IDE integration (floating terminal + diff) |
| Motion | [vim-easymotion](https://github.com/easymotion/vim-easymotion) | 2-char jump anywhere |
| Text objects | [vim-surround](https://github.com/tpope/vim-surround) | Add / change / delete surrounds |
| Syntax | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Highlight + indent + incremental selection |
| LSP | [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + [mason.nvim](https://github.com/williamboman/mason.nvim) | Nvim 0.11 API (`vim.lsp.config` / `vim.lsp.enable`) |
| Completion | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) + [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | LSP, snippets, buffer, path sources |
| Formatting | [conform.nvim](https://github.com/stevearc/conform.nvim) | Format on save + on-demand |
| Git signs | [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Hunk preview, blame, reset |
| Git commands | [vim-fugitive](https://github.com/tpope/vim-fugitive) | Full Git CLI inside Neovim |
| Keymap help | [which-key.nvim](https://github.com/folke/which-key.nvim) | Popup after 500 ms delay |
| TODO highlights | [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | `TODO`, `FIX`, `NOTE`, etc. |
| Auto-pairs | [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Treesitter-aware bracket pairing |
| Comments | [Comment.nvim](https://github.com/numToStr/Comment.nvim) | `gcc` / `gc{motion}` |

### LSP servers (auto-installed via Mason)

| Server | Language |
|---|---|
| `lua_ls` | Lua |
| `gopls` | Go |
| `pyright` | Python |
| `ts_ls` | JavaScript & TypeScript |
| `eslint` | JS/TS linting via LSP |
| `terraformls` | Terraform / HCL |
| `yamlls` | YAML |
| `bashls` | Bash / Shell |

### Treesitter parsers (auto-installed)

`lua` · `go` · `python` · `terraform` · `yaml` · `json` · `bash` ·
`markdown` · `markdown_inline` · `dockerfile` · `hcl` · `toml` ·
`javascript` · `typescript` · `tsx` · `jsdoc`

### Formatters (install separately via Mason or your system package manager)

| Formatter | Filetypes |
|---|---|
| `stylua` | Lua |
| `gofmt` | Go |
| `black` | Python |
| `terraform_fmt` | Terraform |
| `prettier` | YAML, JSON, JS, JSX, TS, TSX, CSS, HTML |
| `shfmt` | Shell |

---

## Keymaps

**Leader key:** `Space` · **Local leader:** `\`

Press `<leader>` and pause — which-key shows a labelled popup for every prefix.

### Navigation

| Key | Mode | Action |
|---|---|---|
| `<C-h/j/k/l>` | n | Move between splits |
| `<C-d>` / `<C-u>` | n | Scroll half-page down/up (view centred) |
| `n` / `N` | n | Next/prev search match (view centred) |

### Insert mode

| Key | Mode | Action |
|---|---|---|
| `jk` | i | Escape to Normal mode |

### Files & finder

| Key | Action |
|---|---|
| `<leader>e` | Toggle file explorer (Snacks) |
| `<leader><space>` | Smart find — files + recent |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Open buffers picker |
| `<leader>fr` | Recent files |
| `<leader>fh` | Help tags |
| `<leader>fc` | Commands picker |
| `<leader>fw` | EasyMotion word forward |
| `<leader>fW` | EasyMotion word backward |
| `<leader>:` | Command history |

### Buffers

| Key | Action |
|---|---|
| `<S-h>` / `<S-l>` | Cycle to prev / next buffer |
| `<leader>bd` | Delete (close) buffer |
| `<leader>bo` | Close all other buffers |
| `<leader>bp` | Pin / unpin buffer |
| `<leader>bP` | Close all unpinned buffers |
| `<leader>b[` / `<leader>b]` | Move buffer tab left / right |

### Splits

| Key | Action |
|---|---|
| `<leader>sv` | Split vertically |
| `<leader>sh` | Split horizontally |
| `<leader>sc` | Close current split |
| `<leader>sm` | Maximize / restore current split (toggle) |
| `<leader>sH` | Move buffer to left split |
| `<leader>sJ` | Move buffer to bottom split |
| `<leader>sK` | Move buffer to top split |
| `<leader>sL` | Move buffer to right split |

### LSP

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | References (Snacks picker) |
| `K` | Hover documentation |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |
| `<leader>d` | Diagnostic float |
| `[d` / `]d` | Prev / next diagnostic |

### Code

| Key | Action |
|---|---|
| `<leader>cf` | Format buffer on demand (conform, LSP fallback) |
| `gcc` | Toggle line comment |
| `gc{motion}` | Toggle comment over motion |
| `<C-space>` | Expand treesitter selection |
| `<bs>` | Shrink treesitter selection |

### Markdown

> These keymaps are only active when the current buffer is a `.md` file.
> The plugin renders headings, code blocks, checkboxes, and bullet icons
> in Normal mode, and automatically hides the decorations in Insert mode
> so raw editing is never obscured.

| Key | Action |
|---|---|
| `<leader>mt` | Toggle markdown render on/off |
| `<leader>me` | Enable markdown render |
| `<leader>md` | Disable markdown render |

### AI — Claude Code

> Requires the [Claude Code CLI](https://claude.ai/download) to be installed
> and authenticated. Run `which claude` after install to verify it's on your
> `$PATH`. The IPC server starts automatically when Neovim opens.

| Key | Mode | Action |
|---|---|---|
| `<leader>ac` | n | Toggle Claude float (open / close) |
| `<leader>af` | n, v | Focus Claude terminal |
| `<leader>ar` | n | Resume last session (`--resume`) |
| `<leader>aC` | n | Continue conversation (`--continue`) |
| `<leader>ab` | n | Add current buffer as context |
| `<leader>as` | v | Send visual selection to Claude |
| `<leader>aa` | n | Accept Claude diff |
| `<leader>ad` | n | Deny Claude diff |
| `<leader>ac` | t | Hide Claude float (from inside terminal) |

### Git

| Key | Action |
|---|---|
| `<leader>gs` | Open Lazygit |
| `<leader>gl` | Git log (Lazygit) |
| `<leader>gB` | Git branches picker |
| `]c` / `[c` | Next / prev hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hb` | Toggle current line blame |

### Toggle

| Key | Action |
|---|---|
| `<leader>tn` | Toggle relative line numbers |
| `<leader>td` | Toggle inline diagnostics (virtual text) |
| `<leader>z` | Toggle zen mode |

### Notifications

| Key | Action |
|---|---|
| `<leader>n` | Notification history picker |
| `<leader>nd` | Dismiss all notifications |
| `<leader>nl` | Show last message |
| `<leader>nh` | Message history |

### Motion (EasyMotion)

| Key | Action |
|---|---|
| `s{char}{char}` | Jump to any 2-char sequence on screen |
| `<leader>j` | Jump to line below |
| `<leader>k` | Jump to line above |

### Surround (vim-surround)

| Key | Action |
|---|---|
| `ys{motion}{char}` | Add surround around motion |
| `cs{old}{new}` | Change surround character |
| `ds{char}` | Delete surround character |
| `S{char}` | Surround visual selection |

### Completion (nvim-cmp)

| Key | Action |
|---|---|
| `<C-n>` / `<C-p>` | Select next / prev item |
| `<Tab>` / `<S-Tab>` | Next / prev item or jump snippet |
| `<CR>` | Confirm selection |
| `<C-Space>` | Trigger completion |
| `<C-e>` | Abort completion |
| `<C-b>` / `<C-f>` | Scroll docs up / down |

### Misc

| Key | Action |
|---|---|
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `<leader>h` | Clear search highlights |
| `<leader>.` | Open scratch buffer |
| `<leader>p` (visual) | Paste without overwriting yank register |
| `J` / `K` (visual) | Move selected lines down / up |

---

## Notable Behaviours

**Transparency** — `Normal`, `NormalFloat`, `NormalNC`, `SignColumn`,
`StatusLine`, and `WinSeparator` all have `bg = NONE`, letting your terminal's
own background show through. Set your terminal emulator's opacity to taste.

**Format on save** — conform.nvim runs automatically on `BufWritePre`.
Use `<leader>cf` for on-demand formatting without saving.

**LSP uses Neovim 0.11+ native API** — servers are registered with
`vim.lsp.config()` and enabled with `vim.lsp.enable()`. The old
`require('lspconfig')[server].setup{}` pattern is not used.

**TypeScript / JavaScript** — `ts_ls` attaches when a `tsconfig.json` or
`package.json` is found in the project root. Opening a lone `.ts` file outside
a project folder will not activate it — this is standard LSP root-detection
behaviour. `eslint` runs alongside `ts_ls` and surfaces lint errors as LSP
diagnostics so they appear in the gutter and with `[d` / `]d`.

**Markdown rendering** — render-markdown.nvim decorates `.md` files with
styled headings (level icons `󰲡`–`󰲫`), fenced code block backgrounds,
bullet icons per nesting level, and checkbox icons. Decorations are active
in Normal/Command/Terminal mode and automatically hidden in Insert mode so
you always edit raw text. Use `<leader>mt` to toggle it on/off at any time.

**Claude Code integration** — claudecode.nvim opens a floating terminal that
runs the `claude` CLI. It registers an IPC server when Neovim starts
(`auto_start = true`) so the CLI can connect and receive editor context
(open file, cursor position, active selection) without any extra steps.
Diffs proposed by Claude appear as standard Neovim diffs — accept with
`<leader>aa` or deny with `<leader>ad`.

**Bufferline only appears with 2+ buffers** — `always_show_bufferline = false`
keeps the UI clean when editing a single file.

**Snacks explorer replaces netrw** — opening a directory (e.g. `nvim .`) will
launch the Snacks file explorer instead of netrw.

**Persistent undo** — undo history survives across sessions, stored in
Neovim's state directory (`stdpath("state")/undo`).

**Smart case search** — searches are case-insensitive unless you type a
capital letter.

**Clipboard** — yanks go directly to the system clipboard (`unnamedplus`).
Use `<leader>p` in visual mode to paste from the unnamed register without
overwriting your yank.
