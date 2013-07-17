(defconst runningWindows    (eq system-type 'windows-nt) "Running Windows")
(defconst runningOSX    (eq system-type 'darwin) "Running OSX")
(defconst runningCygwin   (eq system-type 'cygwin) "Running Cygwin")
(defconst runningLinux    (or (eq system-type 'gnu/linux)  (eq system-type 'linux)) "Running UNIX/Linux")

;;Use Consolas font in Windows, Inconsolata otherwise
(if runningWindows
    (set-face-attribute 'default nil :height 128 :family "Consolas")
  (set-face-attribute 'default nil :height 128 :family "Inconsolata"))

;;General cleanup and standardization
(setq inhibit-startup-message t) ; Don't show the startup screen
(kill-buffer "*scratch*")        ; Don't need scratch buffer
(fset 'yes-or-no-p 'y-or-n-p)    ; "y or n" instead of "Yes or No"
(tool-bar-mode -1)               ; Hide the tool and menu bar
(menu-bar-mode -1)
(setq line-number-mode t)        ; Display line number and column numbers
(setq column-number-mode t)
(set-default 'indicate-empty-lines t) ;Explicitly show the end of a buffer
(set-default 'fill-column 80)    ; Line-wrapping

;;Standard cut and paste, standard highlighting
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour
(setq x-select-enable-clipboard t)

;;Prevent the annoying beep on errors
(setq visible-bell t)

;;Show the matching parens
(show-paren-mode t)

;;Make sure that all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;;Remvoe unnecessary Trailing whitespace
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))
(put 'upcase-region 'disabled nil)

;; Set colored syntax highlighting:
(require 'font-lock)
(global-font-lock-mode t)
(setq-default font-lock-auto-fontify t)

;; IDO
;; Switch interactively between buffers, "C-x b", "C-x C-f"
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;;Theming -- Reqires emacs 24 so don't run on linux yet
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'railscast t)
(setq ansi-color-names-vector
      ["black" "red" "green" "yellow" "lightBlue" "magenta" "cyan" "white"])

;;Orgmode awesomeness
(add-to-list 'load-path "~/.emacs.d/plugins/org-7.8.11")
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done t)

;Fix the settings for the tab character
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq-default c-basic-offset 4)

;;Turn on Word wrap
(global-visual-line-mode t)

;;Change the title of the emacs windows to the path of the filen
(setq frame-title-format
      '("emacs - " (buffer-file-name "%f"
                                     (dired-directory dired-directory "%b"))))

;;Close the buffer with Ctrl-w
(global-set-key (kbd "C-w") 'kill-this-buffer)

;; Desktop that is used to restore default tabs
(setq desktop-path '("~/.emacs.d/desktop"))
(setq desktop-dirname "~/.emacs.d/desktop")
(setq desktop-base-file-name "emacs-desktop")
(setq desktop-load-locked-desktop t)

(defun saved-session ()
  (file-exists-p (concat desktop-dirname "/" desktop-base-file-name)))

;; use session-restore to restore the desktop manually
(defun session-restore ()
  "Restore a saved emacs session."
  (interactive)
  (if (saved-session)
      (desktop-read)
    (message "No desktop found.")))

;; use session-save to save the desktop manually
(defun session-save ()
  "Save an emacs session."
  (interactive)
  (if (saved-session)
      (if (y-or-n-p "Overwrite existing desktop? ")
          (desktop-save-in-desktop-dir)
        (message "Session not saved."))
    (desktop-save-in-desktop-dir)))

(if runningWindows
(add-hook 'after-init-hook  (session-restore)))

;; Setup Aspell in windows to work with Emacs
(if runningWindows
  (setq-default ispell-program-name "C:/Program Files (x86)/Aspell/bin/aspell.exe")
  (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
  (setq ispell-program-name "aspell"))

(require 'ispell)
(setq ispell-personal-dictionary "~/.emacs.d/plugins/ispellCustomDictionary/ispell.txt")
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
  )
(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)
(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
(global-set-key (kbd "C-M-<f8>") 'flyspell-buffer)
(global-set-key (kbd "C-<f8>") 'flyspell-check-previous-highlighted-word)

;; Enable fly-spell to work with text files and prof fly spell to work on comments
(add-hook 'org-mode-hook 'turn-on-flyspell)
(add-hook 'tex-mode-hook 'turn-on-flyspell)
(defun turn-on-flyspell ()
  "Force flyspell-mode on using a positive arg.  For use in hooks."
  (interactive)
  (flyspell-mode 1))

;;GotoLine [Alt]-[L]
(global-set-key (kbd "M-l") 'goto-line)

;; UTF-8 goodness
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;This is for removing the copying feature when text is selected
(setq mouse-drag-copy-region nil)

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

;;Setting up file types associations with modes
(setq auto-mode-alist (cons '("\\.j2" . html-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.txt" . org-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.scss" . css-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.yaml" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("GemFile.*" . ruby-mode) auto-mode-alist))

(global-unset-key (kbd "<mouse-2>"))

;; Acts as Meta-x
(global-set-key "\C-x\C-m" 'execute-extended-command)

;; Setup Duplication line fucntion
(defun duplicate-line-down()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )
(defun duplicate-line-up()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (previous-line 1)
  (yank)
  )
(global-set-key (kbd "C-M-<up>") 'duplicate-line-up)
(global-set-key (kbd "C-M-<down>") 'duplicate-line-down)


(global-set-key (kbd "M-p") 'scroll-down)
(global-set-key (kbd "M-n") 'scroll-up)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-PDF-mode t)
(setq doc-view-continuous t)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq auto-mode-alist (cons '("GemFile.*" . ruby-mode) auto-mode-alist))

;; Auctex stuff when running windows
(if runningWindows
  (setq-default TeX-master nil)
  (setq reftex-plug-into-AUCTeX t)
  (load "auctex.el" nil t t)
  (require 'tex-mik))

;;Yasnippet!
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
(global-set-key (kbd "C-SPC") 'yas-expand)


;;Autocomplete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-1.3.1")
(require 'auto-complete)
(global-auto-complete-mode t)

;;Ctrl-Tab through buffers like a browser
(global-set-key (kbd "C-<tab>") 'bury-buffer)
(global-set-key (kbd "C-S-<tab>") 'unbury-buffer)

(global-set-key (kbd "C-<f11>") 'compile)

;;Unindent like eclipse
(defun unindent-line-or-region ()
  (interactive)
  (if mark-active
      (decrease-left-margin (region-beginning) (region-end) nil)
    (decrease-left-margin (point-at-bol) (point-at-eol) nil))
  (setq deactivate-mark nil))

(global-set-key (kbd "S-<tab>") 'unindent-line-or-region)

(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

;;Move lines up and down with alt up/down
(global-set-key (kbd "<M-up>") 'move-line-up)
(global-set-key (kbd "<M-down>") 'move-line-down)

;;Reverts all of the buffers currently open
(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (not (buffer-modified-p)))
        (revert-buffer t t t) )))
  (message "Refreshed open files.") )
(put 'downcase-region 'disabled nil)
(global-set-key (kbd "<f5>") 'revert-all-buffers)

;; Undo close buffer
(defun undo-kill-buffer (arg)
  "Re-open the last buffer killed.  With ARG, re-open the nth buffer."
  (interactive "p")
  (let ((recently-killed-list (copy-sequence recentf-list))
        (buffer-files-list
         (delq nil (mapcar (lambda (buf)
                             (when (buffer-file-name buf)
                               (expand-file-name (buffer-file-name buf)))) (buffer-list)))))
    (mapc
     (lambda (buf-file)
       (setq recently-killed-list
             (delq buf-file recently-killed-list)))
     buffer-files-list)
    (find-file
     (if arg (nth arg recently-killed-list)
       (car recently-killed-list)))))

; Add date/time stamp to buffer
(defun insert-time()
  (interactive)
  (insert (format-time-string "%D %I:%M%p")))
(global-set-key (kbd "\C-x\C-t") 'insert-time)

(defun remove-newlines-in-region ()
  "Removes all newlines in the region."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "\n" nil t) (replace-match " " nil t))))

; Opens the folder of the current directory
(if runningWindows
  (defun open-folder ()
    "Launch the windows explorer in the current directory and selects current file"
    (interactive)
    (w32-shell-execute
     "open"
     "explorer"
     (concat "/e,/select," (convert-standard-filename buffer-file-name)))))

;; Remove auto version control in windows because it slows it down
(if runningWindows
  (remove-hook 'find-file-hooks 'vc-find-file-hook))

;; Auto pair for brackets
(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'autopair)
(autopair-global-mode 1) ;; enable autopair in all buffers
(setq autopair-autowrap t)

;; Join lines (remove space)
(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

;;Comment or uncomment region like eclipse
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(global-set-key (kbd "C-/") 'comment-or-uncomment-region-or-line)

; Standard undo-redo
(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'undo-tree)
(global-undo-tree-mode 1)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)

;; Setting replace-string and replace-regexp shortcuts
(global-set-key (kbd "C-r") 'replace-string)
(global-set-key (kbd "C-S-r") 'replace-regexp)

; Mark Down mode
(add-to-list 'load-path "~/.emacs.d/plugins")
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(setq max-lisp-eval-depth 2000)
