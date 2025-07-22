-- netrw configuration
-- Place this file in your '~/.config/nvim/lua/' directory
-- and source it from your 'init.lua' using `require('netrw_config')`

local g = vim.g

-- netrw_banner: Toggles whether the banner showing tips about netrw appears.
-- Possible values:
--   0: Disable the banner
--   1: Enable the banner (default)
-- Most people tend to set it to 0 to remove the clutter.
g.netrw_banner = 1

-- netrw_liststyle: Sets the style of the file listing screen.
-- Possible values:
--   0: Thin listing with directory hierarchy shown in the first column
--   1: Thick listing with file details (default)
--   2: Tree-style listing
--   3: Thin listing without directory hierarchy
--   4: Tree-style listing with file details
-- Many prefer 3 or 2 for a cleaner or more organized display.
g.netrw_liststyle = 1

-- netrw_browse_split: Determines behavior for opening files from netrw.
-- Possible values:
--   0: Open in the current window (default)
--   1: Open in a new horizontal split
--   2: Open in a new vertical split
--   3: Open in a new tab
-- Commonly set to 3 for using tabs for navigation.
g.netrw_browse_split = 0

-- netrw_altv: Sets whether vertical splits from netrw go to the left or right.
-- Possible values:
--   0: Vertical splits go to the right (default)
--   1: Vertical splits go to the left
-- Many users leave this at the default.
g.netrw_altv = 0

-- netrw_winsize: Controls the size of the created window for file browsing.
-- Default value: 25 (percentage of the total window size)
-- This can be adjusted to make the file explorer larger or smaller.
-- Commonly, users set it between 20 and 30.
g.netrw_winsize = 25

-- netrw_keepdir: Controls whether netrw changes to the directory being browsed.
-- Possible values:
--   0: Change to the directory being browsed
--   1: Stay in the current working directory (default)
-- Many leave this at the default as it avoids confusion with `pwd`.
g.netrw_keepdir = 1

-- netrw_localrmdir: Specifies the command used to remove local directories.
-- Default value: 'rm -r'
-- This can be customized if you use alternative directory removal commands.
g.netrw_localrmdir = 'rm -r'

-- netrw_hide: Toggles whether dotfiles (hidden files) are displayed in netrw.
-- Possible values:
--   0: Show dotfiles
--   1: Hide dotfiles (default)
-- This is commonly set to 0 to show hidden files for convenience.
g.netrw_hide = 1

-- netrw_preview: Toggles whether files are previewed when selecting them.
-- Possible values:
--   0: No preview
--   1: Show previews (default)
-- Users often set this to 0 for faster navigation without previews.
g.netrw_preview = 1

-- netrw_list_hide: A pattern for hiding files in the netrw listing.
-- Default value: '^\\./$,\\.^../$'
-- You can customize this to hide specific types of files.
-- Some people add extra patterns for temporary or unwanted files.
g.netrw_list_hide = '^\\./$,\\.^../$'

-- netrw_fastbrowse: Toggles whether fast browsing is enabled.
-- Possible values:
--   0: Disable fast browsing
--   1: Enable fast browsing (default)
-- Fast browsing improves responsiveness and is usually left enabled.
g.netrw_fastbrowse = 1

-- netrw_bufsettings: Specifies additional settings for the netrw buffer.
-- Default value: 'noma nomod nu nobl nowrap ro'
-- This can be customized, but most users leave this unchanged.
g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

-- netrw_sizemode: Determines whether files are sorted by size or name.
-- Possible values:
--   0: Sort by name (default)
--   1: Sort by file size
-- Many leave this at the default.
g.netrw_sizemode = 0

-- netrw_sort_options: Specifies sorting criteria for file listing.
-- Default value: ''
-- Possible values include: 'f', 'v', 's', 't', and combinations.
-- Common customizations: Many add 'v' for alphabetical sorting of directories.
g.netrw_sort_options = ''

-- netrw_http_cmd: Specifies the command used for HTTP requests.
-- Default value: 'curl -s'
-- You can change this if you prefer an alternative HTTP client.
g.netrw_http_cmd = 'curl -s'

-- netrw_tree_sizestyle: Specifies the style for directory sizes in tree view.
-- Possible values:
--   0: Human-readable sizes (default)
--   1: Raw byte sizes
-- Some users tend to prefer raw byte sizes for precision.
g.netrw_tree_sizestyle = 0

-- netrw_timefmt: Specifies the format of timestamps in netrw file listings.
-- Default value: '%F %T'
-- You can customize this for different date/time formats.
g.netrw_timefmt = '%F %T'
