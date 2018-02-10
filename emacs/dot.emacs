;; -*- mode: Emacs-lisp -*-

;; M-x blink-cursor-mode
(blink-cursor-mode -1)

;; cursor stretches to cover whole glyph
(setq x-stretch-cursor t)

;; http://melpa.org/#/getting-started
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
;; initialize installed packages
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/elpa")

;; ;; http://auto-complete.org/
;; ;;(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20150408.1132")
;; ;;(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20150408.1132/dict")
;; ;;(add-to-list 'load-path "~/.emacs.d/elpa/popup-20150315.612")
;; (require 'auto-complete-config)
;; (ac-config-default)

(require 'ido)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode t)


(show-paren-mode)


;; http://www.emacswiki.org/emacs/BackspaceKey
(global-set-key [(control h)] 'delete-backward-char)
(put 'narrow-to-region 'disabled nil)

;; (setq inferior-lisp-program "/usr/bin/sbcl")
;; (setq slime-contribs '(slime-fancy))


(tool-bar-mode -1)
;;https://www.gnu.org/software/emacs/manual/html_node/emacs/Display-Custom.html#Display-Custom
(setq echo-keystrokes 0.1)

;; highlight current line
(global-hl-line-mode 1)


(setq x-select-enable-clipboard t)


(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(setq inhibit-startup-screen t)

(require 'evil)
;;(evil-mode 1)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)


(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (sh . t)
   (latex . t)
   ))

(setq org-babel-sh-command "bash")

;;(set-default-font "DejaVu Sans Mono-14") ; this does NOT work with emacs --daemon
(setq default-frame-alist '((font . "DejaVu Sans Mono-14")))


;; mode line settings
(line-number-mode t)
(column-number-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)


;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)


;; hippie expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

(setq-default indent-tabs-mode nil)


(setq auto-mode-alist (append '(("PKGBUILD" . shell-script-mode)) auto-mode-alist))


(which-function-mode 1)


(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5))

(elpy-enable)
;(elpy-use-ipython)

;; ;; https://github.com/jorgenschaefer/elpy/issues/992
;; (setenv "IPY_TEST_SIMPLE_PROMPT" "1")

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; ;; why the following does not work? TODO
;; (setq python-shell-interpreter "jupyter"
;;       python-shell-interpreter-args "console --simple-prompt")

;; (ansi-color-for-comint-mode-on)
(ansi-color-for-comint-mode-on)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; https://www.emacswiki.org/emacs/FillColumnIndicator
(add-hook 'after-change-major-mode-hook 'fci-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (dockerfile-mode markdown-mode magit projectile helm yaml-mode fill-column-indicator evil elpy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(projectile-global-mode)


;; ENSURE ROOT also has this config. It caused me lots of worries when
;; editing config files for nginx. The backup mechnism left a
;; pbot_nginx.conf~ in the directory /etc/nginx/sites-enabled and even
;; when I modified nginx.conf the old settings were being read because
;; of a 'include /etc/sites-enabled/*' in /etc/nginx/nginx.conf file
(setq backup-directory-alist `(("." . "~/.emacs_backups")))


(require 'ox-odt)
(require 'ox-md)


;; UTF-8 as default encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8-unix)

;; remember cursor position in file
(save-place-mode 1)

;; https://www.emacswiki.org/emacs/DeletingWhitespace
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;http://batsov.com/articles/2011/11/25/emacs-tip-number-3-whitespace-cleanup/
(add-hook 'before-save-hook 'whitespace-cleanup)

;; scratch buffer config
(setq initial-scratch-message nil)
(setq initial-major-mode 'org-mode)


;; fuzzy isearch
;; https://www.reddit.com/r/emacs/comments/3yxk2x/flexible_isearch_without_a_package/
(setq search-whitespace-regexp ".*?")
