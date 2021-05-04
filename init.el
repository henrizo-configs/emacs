(package-initialize)

;; <package_refs>
(add-to-list 'load-path "~/.emacs.d/elpa")

;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa"     . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org"       . "http://orgmode.org/elpa/")) ; Org-mode's repository
;; </package_refs>

;; <custom set vars>
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("~/Dropbox/my_org/agenda/my_agenda.org" "~/Dropbox/my_org/ponies/ponies.org" "~/Dropbox/my_org/projects/JackSparrow/jacksparrow_backlog.org" "~/Dropbox/my_org/projects/JackSparrow/musics_to_download.org" "~/Dropbox/my_org/projects/canonical_projects/Art/art_backlog.org" "~/Dropbox/my_org/projects/canonical_projects/Finances/finances_backlog.org" "~/Dropbox/my_org/projects/canonical_projects/Habits/habits_backlog.org" "~/Dropbox/my_org/projects/canonical_projects/Habits/my_habits.org" "~/Dropbox/my_org/projects/canonical_projects/Health/health_backlog.org" "~/Dropbox/my_org/projects/canonical_projects/Music/music_backlog.org" "~/Dropbox/my_org/projects/canonical_projects/Org/org_backlog.org" "~/Dropbox/my_org/projects/canonical_projects/Professional/professional_backlog.org" "~/Dropbox/my_org/projects/canonical_projects/Sports/sports_backlog.org" "~/Dropbox/my_org/my_org_rules.org"))
 '(package-selected-packages
   '(org-gcal json-navigator haskell-mode rust-mode yafolding flyspell-correct atomic-chrome multi-line ein ledger-mode htmlize lua-mode latex-preview-pane skewer-mode omnisharp doom-themes powerline perspective neotree helm flycheck company auto-highlight-symbol auto-complete ace-jump-mode))
 '(safe-local-variable-values '((org-after-todo-state-change-hook . org-refile-todo))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; </custom set vars>

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
(require 'atomic-chrome)
;; </dependencies>

;; <config>
(load-theme 'doom-one t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(set-frame-font "DejaVu Sans Mono-12")

(fset 'yes-or-no-p 'y-or-n-p) ; allows answering y,n instead of yes,no

(setq-default scroll-bar-width  12)    ; sets the width of vertical   scrollbar
(setq-default scroll-bar-height 12)    ; sets the width of horizontal scrollbar
(setq-default c-basic-offset 4)        ; sets CC indent to 4 spaces

(setq-default cursor-type 'bar)        ; sets cursor to bar
(setq-default tab-width 2)             ; sets tab width to 2
(setq-default indent-tabs-mode nil)    ; turns off indent-tabs-mode
(setq-default fci-rule-column 100)
(set-cursor-color "WhiteSmoke")

(put 'upcase-region   'disabled nil)
(put 'downcase-region 'disabled nil)

;; backup in one place. flat, no tree structure
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

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

;; <OmniSharp>
;; I'm not using it because I am currently not programming in C#, but I'll leave it
;; here as a reminder of this package
;; (add-hook 'csharp-mode-hook 'omnisharp-mode)
;; (setq omnisharp-server-executable-path "/opt/omnisharp-server/OmniSharp/bin/Release/OmniSharp.exe" )
;; </OmniSharp>

;; <Neotree>
(global-set-key [f8] 'neotree-toggle)
;; </Neotree>

;; <Org mode>
;; org-modules
(require 'org-inlinetask)
(add-to-list 'org-modules
             'org-habit t)
;; agenda
(setq org-agenda-files (directory-files-recursively "~/Dropbox/my_org/" "\\.org$"))

;; habits
(setq org-habit-preceding-days 30)
(setq org-habit-following-days  0)
(setq org-habit-graph-column   60)
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

;; <Atomic Chrome>
(atomic-chrome-start-server)
;; </Atomic Chrome>

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

;; <g-cal sync config (org-mode and g-calendar integration)>
(setq package-check-signature nil)

(require 'org-gcal)
(setq org-gcal-client-id "client-id"
      org-gcal-client-secret "client-secret"
      org-gcal-file-alist '(("matheus.hs97@gmail.com" .  "~/Dropbox/my_org/agenda/my_agenda.org")))

(add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
(add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))

(global-set-key (kbd "C-c c")  'org-capture)
(setq org-capture-templates
      '(("a" "Appointment" entry (file  "~/Dropbox/my_org/agenda/my_agenda.org" )
         "* %?")
        ))

;; </g-cal sync config (org-mode and g-calendar integration)>
