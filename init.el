(package-initialize)

;; <package_refs>
(add-to-list 'load-path "~/.emacs.d/elpa")

;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa"     . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org"       . "http://orgmode.org/elpa/")) ; Org-mode's repository
;; </package_refs>

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(multi-term exec-path-from-shell emmet-mode prettier-js add-node-modules-path web-mode org-gcal json-navigator haskell-mode rust-mode yafolding flyspell-correct atomic-chrome multi-line ein ledger-mode htmlize lua-mode latex-preview-pane skewer-mode omnisharp doom-themes multi-term multiple-cursors powerline perspective neotree helm flycheck company auto-highlight-symbol auto-complete ace-jump-mode))
 '(safe-local-variable-values '((org-after-todo-state-change-hook . org-refile-todo))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; <dependenciess>
(require 'org)
(require 'package)
(require 'neotree)
(require 'auto-complete)
(require 'auto-highlight-symbol)
(require 'perspective)
(require 'ace-jump-mode)
(require 'multiple-cursors)
(require 'atomic-chrome)
(require 'flycheck)
;; </dependencies>

;; <config>
(load-theme 'adwaita t)
(tool-bar-mode -1)
(menu-bar-mode -1)

(fset 'yes-or-no-p 'y-or-n-p) ; allows answering y,n instead of yes,no

(setq-default scroll-bar-width  12)    ; sets the width of vertical   scrollbar
(setq-default scroll-bar-height 12)    ; sets the width of horizontal scrollbar
(setq-default c-basic-offset 4)        ; sets CC indent to 4 spaces

(setq-default cursor-type 'bar)        ; sets cursor to bar
(setq-default tab-width 2)             ; sets tab width to 2
(setq-default indent-tabs-mode nil)    ; turns off indent-tabs-mode
(setq-default fci-rule-column 100)
(setq-default delete-selection-mode 1) ; replace what I select when I type or so
(set-cursor-color "Black")

(put 'upcase-region   'disabled nil)
(put 'downcase-region 'disabled nil)

;; backup in one place. flat, no tree structure
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

;; stop creating #autosave# files
(setq auto-save-default nil)

;; stop creating .#lockfiles
(setq create-lockfiles nil)

; flycheck checks the buffer 1s after the last change
(setq-default flycheck-idle-change-delay 1)

; ignores org-mode warning on risky variables
(advice-add 'risky-local-variable-p :override #'ignore)
;; </config>

;; <modes_config>
(powerline-center-theme)

(global-company-mode)
(global-linum-mode)
(global-auto-highlight-symbol-mode)
(global-flycheck-mode)

(helm-mode)
(column-number-mode)
(delete-selection-mode)
(persp-mode)
;; </modes_config>

;; <key_config>
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "\M-]")        'scroll-down-line) ; scroll up
(global-set-key (kbd "\M-[")        'scroll-up-line)   ; scroll down
(global-set-key (kbd "M-x")         'helm-M-x)
(global-set-key (kbd "C-x C-f")     'helm-find-files)
(global-set-key (kbd "C-?")         'help-command)
(global-set-key (kbd "M-?")         'mark-paragraph)
(global-set-key (kbd "C-h")         'delete-backward-char)
(global-set-key (kbd "M-h")         'backward-kill-word)
(global-set-key (kbd "C-c SPC")     'ace-jump-mode)
(global-set-key (kbd "C-c C-u SPC") 'ace-jump-char-mode)
(global-set-key (kbd "C-x b")       'helm-mini)
(global-set-key (kbd "C-x k")       'kill-this-buffer)
(global-set-key (kbd "S-C-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>")  'shrink-window)
(global-set-key (kbd "S-C-<up>")    'enlarge-window)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c c")     'mc/mark-pop)
(global-set-key (kbd "C-c m")       'multi-line)
;;keep cursor at same position when scrolling
(setq scroll-preserve-screen-position 1)
;;scroll window up/down by one line
(global-set-key (kbd "M-[") (kbd "C-u 1 C-v"))
(global-set-key (kbd "M-]") (kbd "C-u 1 M-v"))
;; </key_config>

;; <Haskell>
(add-hook 'haskell-mode-hook 'haskell-unicode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'inf-haskell-mode)
;; </Haskell>

;; <Neotree>
(global-set-key [f8] 'neotree-toggle)
;; </Neotree>

;; <Org mode>
;; org-modules
(require 'org-inlinetask)
(add-to-list 'org-modules t)
;; save the clock history across Emacs session
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; <Babel>
;; Keys
(define-key org-mode-map (kbd "C-c SPC") 'ace-jump-mode)

(setq-default org-confirm-babel-evaluate     nil)
(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (haskell    . t)
   (python     . t)
   (C          . t)
   (sql        . t)
   (shell      . t)
   (emacs-lisp . nil)))
;; </Babel>
;; </Org mode>

;; <web-mode>
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode)) ;; auto-enable for .js/.jsx files
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint json-jsonlist)))
(flycheck-add-mode 'javascript-eslint 'web-mode) ;; Enable eslint checker for web-mode
(add-hook 'after-init-hook #'global-flycheck-mode) ;; Enable flycheck globally
(add-hook 'flycheck-mode-hook 'add-node-modules-path)
(defun web-mode-init-prettier-hook ()
  (add-node-modules-path)
  (prettier-js-mode))
(add-hook 'web-mode-hook  'web-mode-init-prettier-hook)
(add-hook 'web-mode-hook  'emmet-mode)
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
;; </web-mode>

;; <custom_functions>
(defun align-whitespace (size)
    "Aligns columns delimited by whitespace."
    (interactive "NSize: ") ;; Number
    (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)\\s-" 1 size 't))

(defun org-refile-to (headline)
  "Moves the current subtree to specified headline"
  (org-refile nil
              nil
              (list headline
                    (buffer-file-name)
                    nil
                    (org-find-exact-headline-in-buffer (capitalize headline)))))

(defun org-refile-todo ()
  "Moves the current subtree to the corresponding todo heading"
  (interactive)
  (when (and (eq (org-current-level) 2)
             (not (member "pin" (org-get-tags))))
    (org-refile-to (org-get-todo-state))))
;; </customfunctions>

;; <exec-path-from-shell>
(exec-path-from-shell-initialize)
;; </exec-path-from-shell>

;; <move-text>
(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(provide 'move-text)


(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)
;;</move-text>
