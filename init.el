(package-initialize)

;; <package_refs>
(add-to-list 'load-path "~/.emacs.d/elpa")

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa"     . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("org"       . "http://orgmode.org/elpa/")) ; Org-mode's repository
;; </package_refs>

;; <dependenciess>
(require 'org)
(require 'org-habit)
(require 'package)
(require 'neotree)
(require 'auto-complete)
(require 'auto-highlight-symbol)
(require 'perspective)
(require 'ace-jump-mode)
(require 'multiple-cursors)
;; </dependencies>

;; <config>
(load-theme 'doom-one t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(set-frame-font "Inconsolata-12")

(fset 'yes-or-no-p 'y-or-n-p) ; allows answering y,n instead of yes,no

(setq-default c-basic-offset 4)     ; sets CC indent to 4 spaces
(setq-default flycheck-idle-change-delay 1)
(setq-default cursor-type 'bar)     ; sets cursor to bar
(setq-default tab-width 2)          ; sets tab width to 2
(setq-default indent-tabs-mode nil) ; turns off indent-tabs-mode
(setq-default fci-rule-column 100)
(set-cursor-color "WhiteSmoke")

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
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

;; <OmniSharp>
;; I'm not using it because I am currently not programming in C#, but I'll leave it
;; here as a reminder of this package
;; (add-hook 'csharp-mode-hook 'omnisharp-mode)
;; (setq omnisharp-server-executable-path "/opt/omnisharp-server/OmniSharp/bin/Release/OmniSharp.exe" )
;; </OmniSharp>

;; <Neotree>
(global-set-key [f8] 'neotree-toggle)
;; </Neotree>
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (multi-line ein ledger-mode htmlize lua-mode latex-preview-pane skewer-mode omnisharp doom-themes powerline perspective neotree helm flycheck company auto-highlight-symbol auto-complete ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; <Org mode>
;; org-modules
(require 'org-inlinetask)
(add-to-list 'org-modules
             'org-habit t)
;; agenda
(setq org-agenda-files '("~/Dropbox/my_org/todos/"
                         "~/Dropbox/my_org/habits/"
                         "~/Dropbox/my_org/agenda/"))

;; habits
(setq org-habit-preceding-days 30)
(setq org-habit-following-days 10)

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
   (ipython    . t)
   (C          . t)
   (sql        . t)
   (shell      . t)
   (emacs-lisp . nil)))
;; </Babel>

;; </Org mode>

;; <custom_functions>
(defun align-whitespace (size)
    "Align columns delimited by whitespace."
    (interactive "NSize: ") ;; Number
    (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)\\s-" 1 size 't))
;; </customfunctions>
