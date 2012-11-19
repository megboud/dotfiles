(defconst runningWindows    (eq system-type 'windows-nt) "Running Windows")
(defconst runningCygwin   (eq system-type 'cygwin) "Running Cygwin")
(defconst runningLinux    (or (eq system-type 'gnu/linux)  (eq system-type 'linux)) "Running UNIX/Linux")
(defconst runningOSX    (eq system-type 'darwin) "Running OSX")

(when runningWindows
  (set-face-attribute 'default nil :height 128 :family "Consolas"))

(when runningLinux
  (set-face-attribute 'default nil :height 128 :family "Inconsolata"))

(when runningCygwin
  (set-face-attribute 'default nil :height 128 :family "Inconsolata"))

;; Don't show the startup screen
(setq inhibit-startup-message t)

;; "y or n" instead of "Yes or No"
(fset 'yes-or-no-p 'y-or-n-p)

;;Highlight regions and add special behaviours to regions
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour
(setq x-select-enable-clipboard t)

;;Hide the toolbar, leave the menu bar for now
(tool-bar-mode -1)
(menu-bar-mode -1)

;;Display line number and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;;Explicitly show the end of a buffer
(set-default 'indicate-empty-lines t)

;;Line-wrapping
(set-default 'fill-column 80)

;;Prevent the annoying beep on errors
(setq visible-bell t)

;;Show the matching parens
(show-paren-mode t)

;;Make sure that all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;;Trailing whitespace is unnecessary
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))
(put 'upcase-region 'disabled nil)

;; setting color syntax highlighting:
(require 'font-lock)
(global-font-lock-mode t)
(setq-default font-lock-auto-fontify t)

;; IDO:
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;;Theming
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'railscast t)

;;Orgmode awesomeness
(add-to-list 'load-path "~/.emacs.d/plugins/org-7.8.11")
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;Fix the settings for the tab character
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;;Turn on Word wrap
(global-visual-line-mode t)

;;Change the title of the emacs windows to the path of the filen
(setq frame-title-format
      '("emacs - " (buffer-file-name "%f"
                                     (dired-directory dired-directory "%b"))))

;;Close the buffer with Ctrl-w
(global-set-key (kbd "C-w") 'kill-this-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; use only one desktop
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
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

(add-hook 'after-init-hook  (session-restore))
;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setup Aspell in windows to work with Emacs
(when runningWindows
(setq-default ispell-program-name "C:/Program Files (x86)/Aspell/bin/aspell.exe")
(add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
(setq ispell-program-name "aspell"))

(require 'ispell)
(setq ispell-personal-dictionary "~/.emacs.d/plugins/ispellCustomDictionary/ispell.txt")
(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
(global-set-key (kbd "C-M-<f8>") 'flyspell-buffer)
(global-set-key (kbd "C-<f8>") 'flyspell-check-previous-highlighted-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
  )
(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)

;; Enable fly-spell to work with text files and prof fly spell to work on comments
;;(add-hook 'message-mode-hook 'turn-on-flyspell)
;;(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'org-mode-hook 'turn-on-flyspell)
;;(add-hook 'c-mode-common-hook 'flyspell-prog-mode)
;;(add-hook 'tcl-mode-hook 'flyspell-prog-mode)
(defun turn-on-flyspell ()
  "Force flyspell-mode on using a positive arg.  For use in hooks."
  (interactive)
  (flyspell-mode 1))

;;GotoLine
(global-set-key (kbd "M-l") 'goto-line);[Alt]-[L]

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

(global-unset-key (kbd "<mouse-2>"))

(global-set-key "\C-x\C-m" 'execute-extended-command)

;; Setup Duplication line fucntion
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-S-d") 'duplicate-line)
(global-set-key (kbd "M-p") 'scroll-down)
(global-set-key (kbd "M-n") 'scroll-up)

;; Auctex stuff when running windows
(when runningWindows
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)
(load "auctex.el" nil t t)
(require 'tex-mik)
(add-hook 'LaTeX-mode-hook (lambda ()(TeX-fold-mode 1))))

;;Yasnippet!
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;;Autocomplete only in Windows
(when runningWindows
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-1.3.1")
(require 'auto-complete)
(global-auto-complete-mode t))
