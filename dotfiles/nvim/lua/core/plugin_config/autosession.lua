local autosession = require("rmagatti/auto-session")

autosession.setup({
  log_level = "error",
  auto_session_supress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
})
