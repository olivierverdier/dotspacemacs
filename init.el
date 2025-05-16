;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; helm
     (auto-completion
      :variables
       auto-completion-return-key-behavior nil
      )
     ;; better-defaults
     bibtex
     c-c++
     colors
     command-log
     coq
     cscope
     dash
     deft
     emacs-lisp
     emoji
     evil-snipe
     ;; eyebrowse
     ;; fasd
     (git :variables
          git-magit-status-fullscreen t
          )
     ;; gnus
     graphviz
     gtags
     (haskell :variables
              haskell-completion-backend 'intero
              )
     html
     ipython-notebook
     javascript
     markdown
     org
     ;; pdf-tools
     ;; (osx :variables
     ;;      osx-use-option-as-meta nil
     ;;  )
     (python :variables
             python-test-runner 'pytest
             )
     (ranger :variables
             ranger-replace-dired t
             )
     search-engine
     semantic
     shell-scripts
     ;; spacemacs-ivy
     spacemacs-layouts
     spell-checking
     syntax-checking
     themes-megapack
     ;; treemacs
     ;; unimpaired
     (latex :variables
            latex-enable-auto-fill nil
            latex-build-command "LaTeX"
            latex-enable-folding nil
            )
     (shell :variables
            shell-default-shell 'shell
            shell-default-height 30
            shell-default-position 'bottom)
     shell-scripts
     (theming :variables
              theming-headings-inherit-from-default 'all
              theming-headings-same-size 'all
              theming-headings-bold 'all)
     version-control
     ;; vim-powerline
     ;; vinegar
     yaml
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '()

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists nil

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "nerd-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         material
                         ample-zen
                         solarized-dark
                         sanityinc-tomorrow-night
                         farmhouse-dark
                         molokai
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         monokai
                         leuven
                         zenburn)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   ;; dotspacemacs-mode-line-theme '(all-the-icons :separator none :separator-scale 1.5)
   dotspacemacs-mode-line-theme '(all-the-icons :separator none :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. This setting has no effect when
   ;; running Emacs in terminal. The font set here will be used for default and
   ;; fixed-pitch faces. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Iosevka"
                               :size 17.0
                               :weight ultra-light
                               :width semi-expanded)

   ;; Default icons font, it can be `all-the-icons' or `nerd-icons'.
   dotspacemacs-default-icons-font 'all-the-icons

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key "\\"
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "M-<return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "M-<return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state t

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; It is also possible to use a posframe with the following cons cell
   ;; `(posframe . position)' where position can be one of `center',
   ;; `top-center', `bottom-center', `top-left-corner', `top-right-corner',
   ;; `top-right-corner', `bottom-left-corner' or `bottom-right-corner'
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; Whether side windows (such as those created by treemacs or neotree)
   ;; are kept or minimized by `spacemacs/toggle-maximize-window' (SPC w m).
   ;; (default t)
   dotspacemacs-maximize-window-keep-side-windows t

   ;; If nil, no load-hints enabled. If t, enable the `load-hints' which will
   ;; put the most likely path on the top of `load-path' to reduce walking
   ;; through the whole `load-path'. It's an experimental feature to speedup
   ;; Spacemacs on Windows. Refer the FAQ.org "load-hints" session for details.
   dotspacemacs-enable-load-hints nil

   ;; If t, enable the `package-quickstart' feature to avoid full package
   ;; loading, otherwise no `package-quickstart' attemption (default nil).
   ;; Refer the FAQ.org "package-quickstart" section for details.
   dotspacemacs-enable-package-quickstart nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; The backend used for undo/redo functionality. Possible values are
   ;; `undo-fu', `undo-redo' and `undo-tree' see also `evil-undo-system'.
   ;; Note that saved undo history does not get transferred when changing
   ;; your undo system. The default is currently `undo-fu' as `undo-tree'
   ;; is not maintained anymore and `undo-redo' is very basic."
   dotspacemacs-undo-system 'undo-fu

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; The variable `global-spacemacs-whitespace-cleanup-modes' controls
   ;; which major modes have whitespace cleanup enabled or disabled
   ;; by default.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )
(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq-default
   ;; Mac
   mac-command-modifier 'meta
   mac-control-modifier 'control
   mac-option-modifier 'nil
   )
  )


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; (setq magit-log-arguments '("--graph" "--color" "--decorate" "--show-signature"))

  (setq-default
   ;; Weeks start on Monday
   calendar-week-start-day 1
   ;; 24h format
   display-time-24hr-format t

   ranger-override-dired t

   )


  (load-file (expand-file-name "llm.el" dotspacemacs-directory))
  (load-file (expand-file-name "latex.el" dotspacemacs-directory))
  (load-file (expand-file-name "theme.el" dotspacemacs-directory))
  (load-file (expand-file-name "misc.el" dotspacemacs-directory))
  (load-file (expand-file-name "evil.el" dotspacemacs-directory))
  (load-file (expand-file-name "modeline.el" dotspacemacs-directory))

  (with-eval-after-load 'org
    (load-file (expand-file-name "org.el" dotspacemacs-directory))
    )




  ;; Ranger
  ;; (setq ranger-show-hidden nil)
  ;; (setq ranger-deer-show-details nil)
  ;; (setq ranger-persistent-sort "t")


  ;; Visual (wrapped) line indicators
  (setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

  ;; Make sure bookmarks are saved from one install to another
  (setq bookmark-default-file (expand-file-name (concat dotspacemacs-directory "bookmarks")))


  ) ;; End of dotspacemacs/user-config

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(ansi-color-faces-vector
     [default bold shadow italic underline bold bold-italic bold])
   '(compilation-message-face 'default)
   '(custom-safe-themes
     '("5bcd0c26bad3303c0325d12dd6562e4f7892d39d390d7db194dd141ba971cad7"
       "f04122bbc305a202967fa1838e20ff741455307c2ae80a26035fbf5d637e325f" default))
   '(evil-want-Y-yank-to-eol t)
   '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
   '(highlight-tail-colors
     '(("#3E3D31" . 0) ("#67930F" . 20) ("#349B8D" . 30) ("#21889B" . 50)
       ("#968B26" . 60) ("#A45E0A" . 70) ("#A41F99" . 85) ("#3E3D31" . 100)))
   '(hl-sexp-background-color "#1c1f26")
   '(magit-diff-use-overlays nil)
   '(magit-log-arguments '("-n256" "--graph" "--decorate" "--color"))
   '(nrepl-message-colors
     '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3"
       "#DC8CC3"))
   '(org-agenda-files '("/Users/olivier/Nextcloud/org/tasks.org"))
   '(package-selected-packages
     '(white-sand-theme rebecca-theme powershell org-mime helm-dash exotica-theme
                        ghub treepy let-alist graphql dash-at-point
                        graphviz-dot-mode zonokai-theme zenburn-theme
                        zen-and-art-theme yapfify yaml-mode xterm-color ws-butler
                        writegood-mode winum which-key web-mode web-beautify
                        volatile-highlights vi-tilde-fringe uuidgen use-package
                        underwater-theme ujelly-theme twilight-theme
                        twilight-bright-theme twilight-anti-bright-theme
                        toxi-theme toc-org tao-theme tangotango-theme
                        tango-plus-theme tango-2-theme tagedit sunny-day-theme
                        sublime-themes subatomic256-theme subatomic-theme
                        stickyfunc-enhance srefactor spaceline powerline
                        spacegray-theme soothe-theme solarized-theme
                        soft-stone-theme soft-morning-theme soft-charcoal-theme
                        smyx-theme smeargle slim-mode shell-pop seti-theme
                        scss-mode sass-mode reverse-theme restart-emacs ranger
                        rainbow-mode rainbow-identifiers rainbow-delimiters
                        railscasts-theme pyvenv pytest pyenv-mode py-isort
                        purple-haze-theme pug-mode professional-theme popwin
                        planet-theme pip-requirements phoenix-dark-pink-theme
                        phoenix-dark-mono-theme persp-mode pcre2el paradox spinner
                        orgit organic-green-theme org-ref pdf-tools key-chord ivy
                        tablist org-projectile org-category-capture org-present
                        org-pomodoro alert log4e gntp org-plus-contrib
                        org-download org-bullets open-junk-file
                        omtose-phellack-theme oldlace-theme occidental-theme
                        obsidian-theme noctilux-theme neotree naquadah-theme
                        mustang-theme multi-term move-text monokai-theme
                        monochrome-theme molokai-theme moe-theme mmm-mode
                        minimal-theme material-theme markdown-toc markdown-mode
                        majapahit-theme magit-gitflow madhat2r-theme macrostep
                        lush-theme lorem-ipsum livid-mode live-py-mode
                        linum-relative link-hint light-soap-theme less-css-mode
                        json-mode json-snatcher json-reformat js2-refactor
                        multiple-cursors js-doc jbeans-theme jazz-theme
                        ir-black-theme intero insert-shebang inkpot-theme info+
                        indent-guide hydra hy-mode hungry-delete htmlize
                        hlint-refactor hl-todo hindent highlight-parentheses
                        highlight-numbers parent-mode highlight-indentation
                        hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes
                        helm-swoop helm-pydoc helm-projectile helm-mode-manager
                        helm-make projectile helm-hoogle helm-gtags helm-gitignore
                        helm-flycheck helm-flx helm-descbinds helm-css-scss
                        helm-cscope xcscope helm-company helm-c-yasnippet
                        helm-bibtex parsebib helm-ag hc-zenburn-theme
                        haskell-snippets haml-mode gruvbox-theme
                        gruber-darker-theme grandshell-theme gotham-theme
                        google-translate golden-ratio gnuplot gitignore-mode
                        gitconfig-mode gitattributes-mode git-timemachine
                        git-messenger git-link git-gutter-fringe+
                        git-gutter-fringe fringe-helper git-gutter+ git-gutter
                        gh-md ggtags gandalf-theme fuzzy flyspell-correct-helm
                        flyspell-correct flycheck-pos-tip pos-tip flycheck-haskell
                        flycheck pkg-info epl flx-ido flx flatui-theme
                        flatland-theme fish-mode fill-column-indicator fasd
                        farmhouse-theme fancy-battery eyebrowse
                        exec-path-from-shell evil-visualstar evil-visual-mark-mode
                        evil-unimpaired evil-tutor evil-snipe
                        evil-search-highlight-persist evil-numbers
                        evil-nerd-commenter evil-mc evil-matchit evil-magit magit
                        magit-popup git-commit with-editor evil-lisp-state
                        smartparens evil-indent-plus evil-iedit-state iedit
                        evil-exchange evil-escape evil-embrace evil-surround
                        embrace expand-region evil-ediff evil-args evil-anzu anzu
                        evil goto-chg undo-tree eval-sexp-fu highlight
                        espresso-theme eshell-z eshell-prompt-extras esh-help
                        engine-mode emoji-cheat-sheet-plus emmet-mode
                        elisp-slime-nav ein skewer-mode request-deferred websocket
                        request deferred js2-mode simple-httpd dumb-jump
                        dracula-theme django-theme disaster diminish diff-hl deft
                        define-word darktooth-theme autothemer darkokai-theme
                        darkmine-theme darkburn-theme dakrone-theme cython-mode
                        cyberpunk-theme company-web web-completion-data
                        company-tern dash-functional tern company-statistics
                        company-shell company-ghci company-ghc ghc haskell-mode
                        company-emoji company-cabal company-c-headers
                        company-auctex company-anaconda company command-log-mode
                        column-enforce-mode color-theme-sanityinc-tomorrow
                        color-theme-sanityinc-solarized color-identifiers-mode
                        coffee-mode cmm-mode cmake-mode clues-theme
                        clean-aindent-mode clang-format cherry-blossom-theme
                        busybee-theme bubbleberry-theme
                        birds-of-paradise-plus-theme bind-map bind-key biblio
                        biblio-core badwolf-theme auto-yasnippet yasnippet
                        auto-highlight-symbol auto-dictionary auto-compile packed
                        auctex apropospriate-theme anti-zenburn-theme
                        anaconda-mode pythonic f dash s ample-theme alect-themes
                        aggressive-indent afternoon-theme adaptive-wrap ace-window
                        ace-link ace-jump-helm-line helm avy helm-core async
                        ac-ispell auto-complete popup ample-zen-theme))
   '(paradox-github-token t)
   '(pos-tip-background-color "#A6E22E")
   '(pos-tip-foreground-color "#272822")
   '(safe-local-variable-values
     '((eval let
             ((default-directory
               (locate-dominating-file buffer-file-name ".dir-locals.el")))
             (make-local-variable 'coq-prog-name)
             (setq coq-prog-name (expand-file-name "../hoqtop")))
       (py-indent-offset . 4)))
   '(weechat-color-list
     (unspecified "#272822" "#3E3D31" "#A20C41" "#F92672" "#67930F" "#A6E22E"
                  "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0"
                  "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(company-tooltip ((t (:weight normal))))
   '(company-tooltip-selection ((t (:foreground "DarkOrange1"))))
   '(fixed-pitch ((t (:weight ultralight))))
   '(font-latex-sectioning-0-face ((t (:inherit default :height 1.0 :weight bold))))
   '(font-latex-sectioning-1-face ((t (:inherit default :height 1.0 :weight bold))))
   '(font-latex-sectioning-2-face ((t (:inherit default :height 1.0 :weight bold))))
   '(font-latex-sectioning-3-face ((t (:inherit default :height 1.0 :weight bold))))
   '(font-latex-sectioning-4-face ((t (:inherit default :height 1.0 :weight bold))))
   '(font-latex-sectioning-5-face ((t (:inherit default :height 1.0 :weight bold))))
   '(font-latex-slide-title-face ((t (:inherit default :height 1.0 :weight bold))))
   '(font-lock-builtin-face ((t (:weight semibold))))
   '(font-lock-comment-face ((t (:slant italic :weight ultralight))))
   '(font-lock-constant-face ((t (:weight semibold))))
   '(font-lock-doc-face ((t (:slant italic :weight ultralight))))
   '(font-lock-function-name-face ((t (:weight semibold))))
   '(font-lock-keyword-face ((t (:weight bold))))
   '(font-lock-string-face ((t (:slant italic))))
   '(helm-selection ((t (:underline t))))
   '(info-title-1 ((t (:inherit default :height 1.0 :weight bold))))
   '(info-title-2 ((t (:inherit default :height 1.0 :weight bold))))
   '(info-title-3 ((t (:inherit default :height 1.0 :weight bold))))
   '(info-title-4 ((t (:inherit default :height 1.0 :weight bold))))
   '(markdown-header-face ((t (:inherit default :height 1.0 :weight bold))))
   '(markdown-header-face-1 ((t (:inherit default :height 1.0 :weight bold))))
   '(markdown-header-face-2 ((t (:inherit default :height 1.0 :weight bold))))
   '(markdown-header-face-3 ((t (:inherit default :height 1.0 :weight bold))))
   '(markdown-header-face-4 ((t (:inherit default :height 1.0 :weight bold))))
   '(markdown-header-face-5 ((t (:inherit default :height 1.0 :weight bold))))
   '(markdown-header-face-6 ((t (:inherit default :height 1.0 :weight bold))))
   '(org-document-title ((t (:inherit default :height 1.0 :weight bold))))
   '(org-kbd ((t (:background "LemonChiffon1" :foreground "dark magenta" :box (:line-width 2 :style released-button)))))
   '(org-level-1 ((t (:inherit default :height 1.0 :weight bold))))
   '(org-level-2 ((t (:inherit default :height 1.0 :weight bold))))
   '(org-level-3 ((t (:inherit default :height 1.0 :weight bold))))
   '(org-level-4 ((t (:inherit default :height 1.0 :weight bold))))
   '(org-level-5 ((t (:inherit default :height 1.0 :weight bold))))
   '(org-level-6 ((t (:inherit default :height 1.0 :weight bold))))
   '(org-level-7 ((t (:inherit default :height 1.0 :weight bold))))
   '(org-level-8 ((t (:inherit default :height 1.0 :weight bold)))))
  ) ;; End of dotspacemacs/emacs-custom-settings
